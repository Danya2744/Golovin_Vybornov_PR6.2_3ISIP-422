   M S B A M L   `   `   `  ����H  DHR_department, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:HR_departmentHR_department  5   	       HR_department.Staff   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:HR_department     5   	     � Title$  Сотрудники��5      $	��600��6   $
��1000��6(    � WindowStartupLocation$ CenterScreen=�65    � 
ResizeMode$ NoResize=�6Z   ���	#FF2D2D30 � 	Resources 5
         RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType ��Name	 �� CornerRadius
 J� RenderTransformOrigin �� ScaleX �� ScaleY �� Triggers P� Property P� Value N� EnterActions �� 
TargetName �� TargetProperty	 W� To g� Duration N� ExitActions  DarkHeaderStyle=  7System.Windows.Controls.Primitives.DataGridColumnHeader  DarkRowStyle)  #System.Windows.Controls.DataGridRow  NoScrollDataGridStyle&   System.Windows.Controls.DataGrid ��Name � ColumnDefinitions � RowDefinitionsG  ASystem.Windows.Controls.Primitives.DataGridColumnHeadersPresenter  Name7  1System.Windows.Controls.DataGridHeadersVisibility   Column �� ConverterParameter!   HeadersVisibilityConverter �� 	Converter �� RelativeSource �� AncestorType  ��Name! �� CanContentScroll" ��Name# �� Orientation$ �� ScrollableHeight% � Maximum& �� ViewportHeight' �� ViewportSize( �� VerticalOffset) � Value* �� ScrollableWidth+ �� ViewportWidth, �� HorizontalOffset- J� SnapsToDevicePixels��%	  &	        &	 j    &	 {    &	 c    �� 5   
   " ��6+   .�5      ��  � �� �	#FF007ACC6+   �� 5       � ��
 �����6+   �� 5       � �� �	#FF007ACC6,   �� 5       � ��$
 10,5q�6(   �� 5       � ��$ 16(�6)   �� 5       � ��$	 148��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ Stretch=�64   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $ border��6!   #��z��5   !   $	 10��5   !   #��z��5   !   $��1q�5   !   $
 0.5,0.5&�5   !   z�5      �� 5   "   $ 1Q�61   $ 1Q�6<   ._�5!      �� $��Center=�6/   $��Center=�6L   5"       5#      P� 5$       �@J�IsMouseOver .  5%   "   �� 5&   &   .��5'   *   �� .��5(   .   W� $ border��6>   $ RenderTransform.ScaleX�5)   >   $
 1.05X�5*   >   $ 0:0:0.1D�6H   W� 5+   .   $ border��6>   $ RenderTransform.ScaleY�5,   >   $
 1.05X�5-   >   $ 0:0:0.1D�6H   5.   +   5/   '    51   "   �� 52   &   .��53   *   �� .��54   .   W� $ border��6>   $ RenderTransform.ScaleX�55   >   $	 1.0X�56   >   $ 0:0:0.1D�6G   W� 57   .   $ border��6>   $ RenderTransform.ScaleY�58   >   $	 1.0X�59   >   $ 0:0:0.1D�6G   5:   +   5;   '   . �5=   "   ��  � �� �	#FF4BA4D96?   5>      5@      5B      5C      �� 5D   
   "  6(   .�5E      ��  � �� �	#FF2525266+   �� 5F       � ��
 �����6+   �� 5G       � ��$
 Bold"�6+   �� 5H       � �� �	#FF3E3E406,   �� 5I       � ��$ 1q�60   �� 5J       � ��$
 10,5q�6(   5K      �� 5L   
   "  6%   .�5M      ��  � �� �	#FF3E3E406+   �� 5N       � ��
 �����6+   �� 5O       � �� �	#FF3E3E406,   �� 5P       � ��$ 1q�60   �� 5Q       � ��$ 5q�6(   5R      �� 5U   
   "  6.   .�5V      ��  � �� 5W      �� 5X      "  6&   .R�5Y      �� #��z��6!   #��z��5Z   !   #��z��5[   !   ._�5\      �� $ DG_ScrollViewer��6+   |�.  ��5]   "   �� 5^   &   " ��66   .R�5_   *   �  5`   .   �� 5a   2   $
��Auto �6C   �� 5b   2   $��* �6C   �� 5c   2   $
��Auto �6C    5e   .   �� 5f   2   $
��Auto �6@   �� 5g   2   $��* �6@   �� 5h   2   $
��Auto �6@   .+�5j   .     $! PART_ColumnHeadersPresenter��6M   $��1��5k   M   y�5l   M   �� *HeadersVisibility+# Z # Z  �� "  �� 5m   .   $!  PART_ScrollContentPresenter��6E   $��2��5n   E   $��1��5o   E   #! z��5p   E   �� 5q   .   $" PART_VerticalScrollBar��68   $��2��5r   8   $��1��5s   8   $# Vertical=�5t   8   $y�	Collapsed=�5u   8   #% z$ 5v   8   #' z& 5w   8   #) z( 5x   8   �� 5y   .   $" PART_HorizontalScrollBar��68   $��1��5z   8   $��2��5{   8   $# 
Horizontal=�5|   8   $y�	Collapsed=�5}   8   #% z* 5~   8   #' z+ 5   8   #) z, 5�   8   5�   +   5�   '   .��5�   "   �� #- z- 61   5�      5�      5�      5�      5�      5�      .��5�      � .+�5�   
   �� ���	#FF252526$	 10��6(   ���	#FF3E3E40$��1q�6R   $��Center=�6f   $��Center=�6�   . �� Padding$. 20q�6�   $	��900��6�   $	��500��6�   ._�5�      � .+�5�      �� -   5        / ��Name$
/ Back��5�      $��
Назад��6'   #��[  67   $
��Left=�6c   $	��Top=�6~   $��	10,-4,0,0q�6�   $	��100��6�   6�   �� 5�      0 �� Orientation$0 
Horizontal=�6   $��Right=�66   $	��Top=�6R   $��0q�6j   .+�5�      �� $"��free-icon-glass-14034708.png��6   $��20��6B   $��20��6M   $��0,0,5,0q�6Y   �� 5�      -   5        1 ��Name$1 SearchTextBox��5�      ���	#FF3E3E40
����������	#FF3E3E40$��5q�6w   $	��200��6�   $��Center=�6�   .��6�   ��5�      �� 5�      " ��6$   .�5�   "   ��  � �� 5�   &   �� 5�   *   " ��6:   .R�5�   .   �� #��z��65   $	 5��6_   #��z��6p   #��z��6�   #. z��6�   ._�5�   2   �� $ PART_ContentHost��6?   $��Center=�6Y   5�   /   5�   +   5�   #   5�      .��5�   )   5�      5�      �� 5�      $��Сотрудники��6   $��24(�6.   $
��Bold"�6<   
�������$��Center=�6a   $��359,-2,359.4,12.4q�6~     5�      -   5        2  Name$2 StaffDataGrid��5�      $��Stretch=�62   $	��Top=�6P   $��0,50,0,0q�6h   $	��350��6z   ���	#FF3E3E40
����������	#FF3E3E403   AutoGenerateColumns3 .  4   ColumnHeaderStyle#4 [ 6�   5   RowStyle#5 [ 6  #��[ 6u  6   Columns6 5�      0  *System.Windows.Controls.DataGridTextColumn  5�      ,  &System.Windows.Controls.DataGridColumn7   Header$7 Фамилия��6-   8   
IsReadOnly8 . 9   Width5  /System.Windows.Controls.DataGridLengthConverter$9 * 6m   1	  +System.Windows.Controls.DataGridBoundColumn: 	  Binding: 6P   �� *
LastName+6m     5�      $7 Имя��6-   8 . $9 * 6j   : 6L   �� *	FirstName+6j     5�      $7 Отчество��6-   8 . $9 * 6p   : 6Q   �� *
MiddleName+6p     5�      $7 
Отдел��6-   8 . $9 * 6m   : 6N   �� *
Department+6m     5�      $7 Должность��6-   8 . $9 * 6o   : 6R   �� *
Position+6o   5�      �� 5�      -   5        $/ 	add_staff��5�      $��Добавить��6,   #��[  6?   $
��Left=�6k   $��20,0,0,0q�6�   $��Bottom=�6�   6�   �� 5�      -   5        $/ change��5�      $��Изменить��6)   #��[  6<   $��Center=�6h   $��0,0,0,0q�6�   $��Bottom=�6�   6�   �� 5�      -   5        $/ Delete_staff��5�      $��Удалить��6/   #��[  6A   $��Right=�6m   $��0,0,20,0q�6�   $��Bottom=�6�   6�   5�      5�      5�      5�      