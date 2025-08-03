using BusinessObject;
using Service;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace QuitHubWPF_App
{
    public partial class UserManagementWindow : Window
    {
        private readonly IUserService _userService = new UserService();
        private List<User> fullUserList = new();

        public UserManagementWindow()
        {
            InitializeComponent();
            LoadUserList();
        }

        private void LoadUserList()
        {
            fullUserList = _userService.UserList();
            UserGrid.ItemsSource = null;
            UserGrid.ItemsSource = fullUserList;
        }

        private void AddUser_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtPassword.Password))
            {
                MessageBox.Show("Username and Password are required.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var user = new User
            {
                Username = txtUsername.Text.Trim(),
                Password = txtPassword.Password,
                FullName = txtFullName.Text.Trim(),
                Age = int.TryParse(txtAge.Text, out int age) ? age : null,
                RoleId = int.TryParse(txtRoleId.Text, out int roleId) ? roleId : 1
            };

            if (_userService.addUser(user))
            {
                MessageBox.Show("User added successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                LoadUserList();
                ClearForm();
            }
            else
            {
                MessageBox.Show("Add failed. Username may already exist.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UpdateUser_Click(object sender, RoutedEventArgs e)
        {
            if (UserGrid.SelectedItem is not User selected)
            {
                MessageBox.Show("Please select a user to update.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            selected.Username = txtUsername.Text.Trim();
            selected.Password = txtPassword.Password;
            selected.FullName = txtFullName.Text.Trim();
            selected.Age = int.TryParse(txtAge.Text, out int age) ? age : null;
            selected.RoleId = int.TryParse(txtRoleId.Text, out int roleId) ? roleId : 1;

            if (_userService.updateUser(selected))
            {
                MessageBox.Show("User updated successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                LoadUserList();
                ClearForm();
            }
            else
            {
                MessageBox.Show("Update failed.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void DeleteUser_Click(object sender, RoutedEventArgs e)
        {
            if (UserGrid.SelectedItem is not User selected)
            {
                MessageBox.Show("Please select a user to delete.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var confirm = MessageBox.Show($"Are you sure you want to delete '{selected.Username}'?", "Confirm Delete", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (confirm == MessageBoxResult.Yes)
            {
                if (_userService.deleteUser(selected.UserId))
                {
                    MessageBox.Show("User deleted successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadUserList();
                    ClearForm();
                }
                else
                {
                    MessageBox.Show("Delete failed.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void ClearForm_Click(object sender, RoutedEventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            txtUsername.Text = "";
            txtPassword.Password = "";
            txtFullName.Text = "";
            txtAge.Text = "";
            txtRoleId.Text = "";
            UserGrid.UnselectAll();
        }

        private void UserGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (UserGrid.SelectedItem is User selected)
            {
                txtUsername.Text = selected.Username;
                txtPassword.Password = selected.Password;
                txtFullName.Text = selected.FullName;
                txtAge.Text = selected.Age?.ToString();
                txtRoleId.Text = selected.RoleId.ToString();
            }
        }

        private void txtSearch_GotFocus(object sender, RoutedEventArgs e)
        {
            if (txtSearch.Text == "Search user...")
            {
                txtSearch.Text = "";
                txtSearch.Foreground = Brushes.Black;
            }
        }

        private void txtSearch_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSearch.Text))
            {
                txtSearch.Text = "Search user...";
                txtSearch.Foreground = Brushes.Gray;
            }
        }

        private void txtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (txtSearch.Text == "Search user...") return;

            string keyword = txtSearch.Text.Trim();
            UserGrid.ItemsSource = null;

            if (string.IsNullOrWhiteSpace(keyword))
            {
                UserGrid.ItemsSource = fullUserList;
            }
            else
            {
                UserGrid.ItemsSource = _userService.SearchUsers(keyword);
            }
        }


        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            new LoginWindow().Show();
            this.Close();
        }

        private void Admin_Click(object sender, RoutedEventArgs e)
        {
            new AdminWindow().Show();
            this.Close();
        }

        private void UserGrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            if (UserGrid.SelectedItem is User selected)
            {
                txtUsername.Text = selected.Username;
                txtPassword.Password = selected.Password;
                txtFullName.Text = selected.FullName;
                txtAge.Text = selected.Age?.ToString();
                txtRoleId.Text = selected.RoleId.ToString();
            }
        }
    }
}
