using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QuitHubWPF_App
{
    /// <summary>
    /// Interaction logic for ChangePasswordWindow.xaml
    /// </summary>
    public partial class ChangePasswordWindow : Window
    {
        private readonly string _currentPassword;

        public string NewPassword { get; private set; }

        public ChangePasswordWindow(string currentPassword)
        {
            InitializeComponent();
            _currentPassword = currentPassword;
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (txtOldPassword.Password != _currentPassword)
            {
                MessageBox.Show("Old password is incorrect.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtNewPassword.Password))
            {
                MessageBox.Show("New password cannot be empty.", "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (txtNewPassword.Password != txtConfirmPassword.Password)
            {
                MessageBox.Show("New passwords do not match.", "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            NewPassword = txtNewPassword.Password;
            DialogResult = true;
            Close();
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
            Close();
        }

    }
}
