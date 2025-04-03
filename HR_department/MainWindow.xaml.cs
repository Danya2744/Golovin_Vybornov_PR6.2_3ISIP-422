﻿using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using Microsoft.Data.SqlClient;

namespace HR_department
{
    public partial class MainWindow : Window
    {
        private const string ConnectionString = "Server=localhost;Database=HR_department;Trusted_Connection=True;TrustServerCertificate=True";
        private int _failedAttempts = 0;
        private string _currentCaptchaText = "";
        private bool _captchaRequired = false;
        private const double WindowHeightWithoutCaptcha = 369.2;
        private const double WindowHeightWithCaptcha = 469.2;

        public MainWindow()
        {
            InitializeComponent();
            UsernameTextBox.Focus();
            CaptchaGrid.Visibility = Visibility.Collapsed;
            this.Height = WindowHeightWithoutCaptcha;
        }

        private void ResetFieldStyles()
        {
            UsernameTextBox.ClearValue(TextBox.BorderBrushProperty);
            UsernameTextBox.ClearValue(TextBox.BorderThicknessProperty);
            PasswordBox.ClearValue(PasswordBox.BorderBrushProperty);
            PasswordBox.ClearValue(PasswordBox.BorderThicknessProperty);
            CaptchaTextBox.ClearValue(TextBox.BorderBrushProperty);
            CaptchaTextBox.ClearValue(TextBox.BorderThicknessProperty);
        }

        private void ShowCustomMessage(string message, bool showCancelButton = false)
        {
            var customBox = new CustomBox(message, showCancelButton);
            customBox.Owner = this;
            customBox.ShowDialog();
        }

        private string GenerateRandomCaptchaText(int length = 5)
        {
            const string chars = "2346789ABCDEFGHJKMNPRTUVWXYZ";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public void GenerateCaptcha()
        {
            _currentCaptchaText = GenerateRandomCaptchaText();

            var visual = new DrawingVisual();
            using (var context = visual.RenderOpen())
            {
                context.DrawRectangle(Brushes.WhiteSmoke, null, new Rect(0, 0, 180, 40));

                var random = new Random();
                for (int i = 0; i < _currentCaptchaText.Length; i++)
                {
                    var formattedText = new FormattedText(
                        _currentCaptchaText[i].ToString(),
                        System.Globalization.CultureInfo.CurrentCulture,
                        FlowDirection.LeftToRight,
                        new Typeface("Arial Black"),
                        20,
                        Brushes.Black,
                        1.0);

                    double x = 15 + i * 30 + random.Next(-3, 3);
                    double y = 10 + random.Next(-2, 2);

                    var transform = new RotateTransform(random.Next(-10, 10));
                    context.PushTransform(transform);

                    formattedText.SetForegroundBrush(Brushes.DimGray);
                    context.DrawText(formattedText, new Point(x + 1, y + 1));
                    formattedText.SetForegroundBrush(Brushes.Black);
                    context.DrawText(formattedText, new Point(x, y));

                    context.Pop();
                }

                for (int i = 0; i < 50; i++)
                {
                    if (random.Next(100) < 30)
                    {
                        context.DrawLine(
                            new Pen(Brushes.LightGray, 1),
                            new Point(random.Next(180), random.Next(40)),
                            new Point(random.Next(180), random.Next(40)));
                    }
                    else
                    {
                        context.DrawEllipse(
                            Brushes.LightGray,
                            null,
                            new Point(random.Next(180), random.Next(40)),
                            random.Next(1, 2),
                            random.Next(1, 2));
                    }
                }
            }

            var bmp = new RenderTargetBitmap(180, 40, 96, 96, PixelFormats.Pbgra32);
            bmp.Render(visual);

            CaptchaImage.Source = bmp;
            CaptchaGrid.Visibility = Visibility.Visible;
            CaptchaTextBox.Text = "";
            _captchaRequired = true;

            this.Height = WindowHeightWithCaptcha;
        }

        private void HideCaptcha()
        {
            CaptchaGrid.Visibility = Visibility.Collapsed;
            _captchaRequired = false;
            this.Height = WindowHeightWithoutCaptcha;
        }

        private bool ValidateFields()
        {
            bool isValid = true;

            if (string.IsNullOrEmpty(UsernameTextBox.Text))
            {
                UsernameTextBox.BorderBrush = Brushes.Red;
                UsernameTextBox.BorderThickness = new Thickness(2);
                isValid = false;
            }

            if (string.IsNullOrEmpty(PasswordBox.Password))
            {
                PasswordBox.BorderBrush = Brushes.Red;
                PasswordBox.BorderThickness = new Thickness(2);
                isValid = false;
            }

            if (_captchaRequired && string.IsNullOrEmpty(CaptchaTextBox.Text))
            {
                CaptchaTextBox.BorderBrush = Brushes.Red;
                CaptchaTextBox.BorderThickness = new Thickness(2);
                isValid = false;
            }

            if (!isValid)
            {
                ShowCustomMessage("Заполните все поля!");
            }

            return isValid;
        }

        public bool Auth(string username, string password)
        {
            if (string.IsNullOrEmpty(username))
            {
                UsernameTextBox.BorderBrush = Brushes.Red;
                UsernameTextBox.BorderThickness = new Thickness(2);
                return false;
            }

            if (string.IsNullOrEmpty(password))
            {
                PasswordBox.BorderBrush = Brushes.Red;
                PasswordBox.BorderThickness = new Thickness(2);
                return false;
            }

            if (_captchaRequired && !CaptchaTextBox.Text.Equals(_currentCaptchaText, StringComparison.OrdinalIgnoreCase))
            {
                CaptchaTextBox.BorderBrush = Brushes.Red;
                CaptchaTextBox.BorderThickness = new Thickness(2);
                ShowCustomMessage("Неверно введена капча!");
                GenerateCaptcha();
                return false;
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    string query = @"SELECT u.UserID, u.Login_user, s.FirstName, s.LastName, s.MiddleName, st.Name_status 
                                    FROM Users u 
                                    JOIN Staff s ON u.EmployeeID = s.EmployeeID
                                    JOIN Status_user st ON u.StatusID = st.StatusID 
                                    WHERE u.Login_user = @Username AND u.Password_user = @Password";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Password", password);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                _failedAttempts = 0;
                                HideCaptcha();

                                string userStatus = reader["Name_status"].ToString();
                                string firstName = reader["FirstName"].ToString();
                                string lastName = reader["LastName"].ToString();
                                string middleName = reader["MiddleName"].ToString();

                                this.Hide();

                                string fullName = string.IsNullOrEmpty(middleName)
                                    ? $"{lastName} {firstName}"
                                    : $"{lastName} {firstName} {middleName}";

                                var welcomeBox = new CustomBox($"Добро пожаловать, {fullName}!", false);
                                if (this.IsVisible)
                                {
                                    welcomeBox.Owner = this;
                                }
                                welcomeBox.ShowDialog();

                                switch (userStatus.ToLower())
                                {
                                    case "администратор":
                                        Admin adminWindow = new Admin();
                                        adminWindow.Show();
                                        break;
                                    case "руководитель":
                                        break;
                                    case "сотрудник":
                                        Employees employees = new Employees();
                                        employees.Show();
                                        break;
                                    default:
                                        ShowCustomMessage("Неизвестный статус пользователя");
                                        this.Show();
                                        break;
                                }
                                return true;
                            }
                            else
                            {
                                _failedAttempts++;

                                if (_failedAttempts >= 3)
                                {
                                    GenerateCaptcha();
                                }

                                return false;
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            ResetFieldStyles();

            if (!ValidateFields())
            {
                return;
            }

            string username = UsernameTextBox.Text.Trim();
            string password = PasswordBox.Password.Trim();

            if (!Auth(username, password))
            {
                UsernameTextBox.BorderBrush = Brushes.Red;
                UsernameTextBox.BorderThickness = new Thickness(2);
                PasswordBox.BorderBrush = Brushes.Red;
                PasswordBox.BorderThickness = new Thickness(2);
                ShowCustomMessage("Неверный логин или пароль");
                UsernameTextBox.Focus();
            }
        }

        private void UsernameTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                PasswordBox.Focus();
            }
        }

        private void PasswordBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                LoginButton_Click(sender, e);
            }
        }

        private void RefreshCaptchaButton_Click(object sender, RoutedEventArgs e)
        {
            GenerateCaptcha();
        }

        public bool IsCaptchaValid(string input)
        {
            return input.Equals(_currentCaptchaText, StringComparison.OrdinalIgnoreCase);
        }

        public string GetCaptchaText()
        {
            return _currentCaptchaText;
        }
    }
}