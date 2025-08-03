using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using BusinessObject;
using Service;

namespace QuitHubWPF_App
{
    public partial class UserCounselingSchedulesWindow : Window
    {
        CounselingScheduleService scheduleService = new CounselingScheduleService();
        UserService userService = new UserService();
        User currentUser;
        CounselingSchedule selectedSchedule;

        public UserCounselingSchedulesWindow(User currentUser)
        {
            InitializeComponent();
            this.currentUser = currentUser;
            LoadUserCounselingSchedules();
        }

        private void User_Click(object sender, RoutedEventArgs e)
        {
            new UserWindow(currentUser.UserId).Show(); 
            this.Close();
        }
        private void LoadUserCounselingSchedules()
        {
            try
            {
                var schedules = scheduleService
                    .getAllCounselingSchedules()
                    .Where(s => s.UserId == currentUser.UserId)
                    .ToList();

                lvSchedule.ItemsSource = schedules;
                lvSchedule.SelectedIndex = -1;
                selectedSchedule = null;
                ClearInput();
                btnUpdate.IsEnabled = false;
                btnDelete.IsEnabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading appointments: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ClearInput()
        {
            dpAppointmentTime.SelectedDate = null;
            txtTopic.Text = "";
            cbStatus.IsChecked = false;
            txtCounselorName.Text = "-- Optional --";
        }

        private void lvSchedule_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lvSchedule.SelectedItem is CounselingSchedule schedule)
            {
                selectedSchedule = schedule;
                txtCounselorName.Text = schedule.Counselor?.FullName ?? "Not assigned";
                dpAppointmentTime.SelectedDate = schedule.ScheduleTime;
                txtTopic.Text = schedule.Topic;
                cbStatus.IsChecked = schedule.IsConfirmed;

                bool isConfirmed = schedule.IsConfirmed ?? false;
                btnUpdate.IsEnabled = !isConfirmed;
                btnDelete.IsEnabled = !isConfirmed;
            }
            else
            {
                btnUpdate.IsEnabled = false;
                btnDelete.IsEnabled = false;
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (dpAppointmentTime.SelectedDate == null || string.IsNullOrWhiteSpace(txtTopic.Text))
                {
                    MessageBox.Show("Please enter all required fields.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                var counselor = userService.GetUserIdByName(txtCounselorName.Text.Trim());
                int counselorId = counselor?.UserId ?? 4;

                var newSchedule = new CounselingSchedule
                {
                    UserId = currentUser.UserId,
                    ScheduleTime = dpAppointmentTime.SelectedDate.Value,
                    CounselorId = counselorId,
                    Topic = txtTopic.Text.Trim(),
                    IsConfirmed = false
                };

                scheduleService.AddCounselingSchedule(newSchedule);
                MessageBox.Show("Appointment added successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                LoadUserCounselingSchedules();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error adding appointment: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            if (selectedSchedule == null)
            {
                MessageBox.Show("Please select an appointment to update.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            try
            {
                if (dpAppointmentTime.SelectedDate == null || string.IsNullOrWhiteSpace(txtTopic.Text))
                {
                    MessageBox.Show("Please enter all required fields.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                string counselorName = txtCounselorName.Text.Trim();
                var counselor = userService.GetUserIdByName(counselorName);

                if (counselor == null)
                {
                    MessageBox.Show("Counselor name not found. Please check again.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                selectedSchedule.ScheduleTime = dpAppointmentTime.SelectedDate.Value;
                selectedSchedule.Topic = txtTopic.Text.Trim();
                selectedSchedule.IsConfirmed = cbStatus.IsChecked == true;
                selectedSchedule.CounselorId = counselor.UserId;

                if (scheduleService.UpdateCounselingSchedule(selectedSchedule))
                {
                    MessageBox.Show("Appointment updated successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadUserCounselingSchedules();
                }
                else
                {
                    MessageBox.Show("No changes detected or invalid data.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error updating appointment: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (selectedSchedule == null)
            {
                MessageBox.Show("Please select an appointment to delete.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            try
            {
                if (MessageBox.Show("Are you sure you want to delete this appointment?", "Confirm Delete", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    scheduleService.DeleteCounselingSchedule(selectedSchedule.ScheduleId);
                    MessageBox.Show("Appointment deleted successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadUserCounselingSchedules();
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
