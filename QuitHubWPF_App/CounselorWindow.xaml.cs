using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using BusinessObject;
using Service;

namespace QuitHubWPF_App
{
    public partial class CounselorWindow : Window
    {
        CounselingScheduleService scheduleService = new CounselingScheduleService();
        UserService userService = new UserService();
        User currentUser;
        CounselingSchedule? selectedSchedule = null;

        public CounselorWindow(User user)
        {
            InitializeComponent();
            currentUser = user;
            LoadAllSchedule();
        }

        private void LoadAllSchedule()
        {
            try
            {
                lvSchedule.ItemsSource = scheduleService
                    .getAllCounselingSchedules()
                    .Where(s => s.CounselorId == currentUser.UserId);
                lvSchedule.SelectedIndex = -1;
                selectedSchedule = null;
                ClearInput();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading schedules: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ClearInput()
        {
            txtCustomerName.Text = string.Empty;
            dpAppointmentTime.SelectedDate = null;
            txtTopic.Text = string.Empty;
            txtStatus.Text = string.Empty;
        }

        private void lvSchedule_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (e.AddedItems.Count <= 0) return;

            selectedSchedule = e.AddedItems[0] as CounselingSchedule;

            if (selectedSchedule != null)
            {
                txtCustomerName.Text = selectedSchedule.User?.FullName ?? "Unknown";
                dpAppointmentTime.SelectedDate = selectedSchedule.ScheduleTime;
                txtTopic.Text = selectedSchedule.Topic;
                txtStatus.Text = (bool)selectedSchedule.IsConfirmed ? "Confirmed" : "Not Confirmed";
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtCustomerName.Text) ||
                    dpAppointmentTime.SelectedDate == null ||
                    string.IsNullOrEmpty(txtTopic.Text))
                {
                    MessageBox.Show("Please enter all required fields.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                var user = userService.GetUserIdByName(txtCustomerName.Text);
                if (user == null)
                {
                    MessageBox.Show("Customer not found.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                var newSchedule = new CounselingSchedule
                {
                    ScheduleTime = dpAppointmentTime.SelectedDate.Value,
                    Topic = txtTopic.Text,
                    IsConfirmed = false,
                    CounselorId = currentUser.UserId,
                    UserId = user.UserId
                };

                scheduleService.AddCounselingSchedule(newSchedule);
                MessageBox.Show("Appointment added successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                LoadAllSchedule();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error adding appointment: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnChangeStatus_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (selectedSchedule == null)
                {
                    MessageBox.Show("Please select an appointment to change status.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                selectedSchedule.IsConfirmed = !selectedSchedule.IsConfirmed;
                scheduleService.UpdateCounselingSchedule(selectedSchedule);

                MessageBox.Show("Appointment status updated successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                LoadAllSchedule();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error changing status: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (selectedSchedule == null)
                {
                    MessageBox.Show("Please select an appointment to update.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                selectedSchedule.ScheduleTime = dpAppointmentTime.SelectedDate ?? DateTime.Now;
                selectedSchedule.Topic = txtTopic.Text;

                scheduleService.UpdateCounselingSchedule(selectedSchedule);
                MessageBox.Show("Appointment updated successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                LoadAllSchedule();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error updating appointment: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (selectedSchedule == null)
                {
                    MessageBox.Show("Please select an appointment to delete.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                var confirm = MessageBox.Show("Are you sure you want to delete this appointment?", "Confirm Delete", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (confirm == MessageBoxResult.Yes)
                {
                    scheduleService.DeleteCounselingSchedule(selectedSchedule.ScheduleId);
                    MessageBox.Show("Appointment deleted successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadAllSchedule();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error deleting appointment: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            new LoginWindow().Show();
            this.Close();
        }
    }
}
