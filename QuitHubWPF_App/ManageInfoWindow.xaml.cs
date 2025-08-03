using System;
using System.Windows;
using System.Windows.Controls;
using BusinessObject;
using Service;

namespace QuitHubWPF_App
{
    public partial class ManageInfoWindow : Window
    {
        private readonly IUserService _userService = new UserService();
        private readonly User _currentUser;
        private string _pendingPassword;

        public ManageInfoWindow(int userId)
        {
            InitializeComponent();
            _currentUser = _userService.GetUserByIdWithRole(userId);
            txtWelcome.Text = "Manage Personal Profile";
            LoadUserInfo();
        }

        private void LoadUserInfo()
        {
            if (_currentUser == null)
            {
                MessageBox.Show("User not found.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                this.Close();
                return;
            }

            txtUserId.Text = _currentUser.UserId.ToString();
            txtUsername.Text = _currentUser.Username;
            txtFullName.Text = _currentUser.FullName;
            txtAge.Text = _currentUser.Age.ToString();
            txtRole.Text = _currentUser.Role?.RoleName ?? "Unknown";
            txtPassword.Text = new string('*', _currentUser.Password?.Length ?? 0);
        }

        private bool HasUnsavedChanges()
        {
            bool passwordChanged = !string.IsNullOrEmpty(_pendingPassword);
            bool usernameChanged = txtUsername.Text.Trim() != _currentUser.Username;
            bool nameChanged = txtFullName.Text.Trim() != _currentUser.FullName;
            bool ageChanged = txtAge.Text.Trim() != _currentUser.Age.ToString();

            return usernameChanged || nameChanged || ageChanged || passwordChanged;
        }

        private bool SaveUserDataOnly()
        {
            string newUsername = txtUsername.Text.Trim();
            string fullName = txtFullName.Text.Trim();
            string ageText = txtAge.Text.Trim();

            if (string.IsNullOrWhiteSpace(newUsername) ||
                string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(ageText))
            {
                MessageBox.Show("Username, Full Name, and Age are required.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            if (!int.TryParse(ageText, out int age))
            {
                MessageBox.Show("Age must be a valid number.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            var existingUser = _userService.GetUserByUsername(newUsername);
            if (existingUser != null && existingUser.UserId != _currentUser.UserId)
            {
                MessageBox.Show("Username is already taken by another user.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            // Update fields
            _currentUser.Username = newUsername;
            _currentUser.FullName = fullName;
            _currentUser.Age = age;

            if (!string.IsNullOrEmpty(_pendingPassword))
            {
                _currentUser.Password = _pendingPassword;
            }

            bool success = _userService.UpdateForUser(_currentUser);

            if (success)
            {
                _pendingPassword = null;
                return true;
            }

            MessageBox.Show("Failed to update user.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            return false;
        }

        private bool SaveAndHandleResult()
        {
            if (SaveUserDataOnly())
            {
                _pendingPassword = null; // ✅ clear only if saved
                LoadUserInfo();
                return true;
            }
            return false;
        }

        private bool ConfirmExitWithSavePrompt()
        {
            if (HasUnsavedChanges())
            {
                var result = MessageBox.Show(
                    "You have unsaved changes. Do you want to save before exiting?",
                    "Unsaved Changes",
                    MessageBoxButton.YesNoCancel,
                    MessageBoxImage.Warning);

                if (result == MessageBoxResult.Cancel) return false;
                if (result == MessageBoxResult.Yes && !SaveAndHandleResult()) return false;
            }
            return true;
        }


        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (SaveAndHandleResult())
            {
                MessageBox.Show("User information updated successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            LoadUserInfo();
            _pendingPassword = null;
        }

        private void txtChangePassword_Click(object sender, RoutedEventArgs e)
        {
            ChangePasswordWindow pwdWindow = new ChangePasswordWindow(_currentUser.Password);
            pwdWindow.Owner = this;

            if (pwdWindow.ShowDialog() == true)
            {
                _pendingPassword = pwdWindow.NewPassword;
                txtPassword.Text = new string('*', _pendingPassword.Length);
                MessageBox.Show("Password updated. Don’t forget to Save changes.", "Info", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            if (!ConfirmExitWithSavePrompt()) return;
            new UserWindow(_currentUser.UserId).Show();
            this.Close();
        }



        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            if (!ConfirmExitWithSavePrompt()) return;
            new LoginWindow().Show();
            this.Close();
        }

    }
}
