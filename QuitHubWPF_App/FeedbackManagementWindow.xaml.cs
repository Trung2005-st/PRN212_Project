using BusinessObject;
using Service;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace QuitHubWPF_App
{
    public partial class FeedbackManagementWindow : Window
    {
        private readonly IFeedbackService _feedbackService = new FeedbackService();
        private readonly IFeedbackResponseService _responseService = new FeedbackResponseService();
        private List<Feedback> fullFeedbackList = new();

        public FeedbackManagementWindow()
        {
            InitializeComponent();
            LoadFeedbackList();
        }

        private void LoadFeedbackList()
        {
            FeedbackGrid.ItemsSource = null;
            fullFeedbackList = _feedbackService.GetAllFeedbacks();
            FeedbackGrid.ItemsSource = fullFeedbackList;
        }

        private void SendResponse_Click(object sender, RoutedEventArgs e)
        {
            if (FeedbackGrid.SelectedItem is not Feedback selected)
            {
                MessageBox.Show("Please select a feedback to respond to.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtResponse.Text))
            {
                MessageBox.Show("Response text is required.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Hardcoded AdminId or fetch from login
            int adminId = 3; // Replace this with actual method

            var response = new FeedbackResponse
            {
                FeedbackId = selected.FeedbackId,
                ResponderId = adminId,
                ResponseText = txtResponse.Text.Trim(),
                RespondedAt = DateTime.Now
            };

            if (_responseService.AddFeedbackResponse(response))
            {
                MessageBox.Show("Response sent successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                txtResponse.Text = "";
            }
            else
            {
                MessageBox.Show("Response already exists for this feedback.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        private void UpdateResponse_Click(object sender, RoutedEventArgs e)
        {
            if (FeedbackGrid.SelectedItem is not Feedback selected)
            {
                MessageBox.Show("Please select a feedback to update response.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var existing = _responseService.GetResponseByFeedbackId(selected.FeedbackId);
            if (existing == null)
            {
                MessageBox.Show("No existing response found to update.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            existing.ResponseText = txtResponse.Text.Trim();
            existing.RespondedAt = DateTime.Now;

            if (_responseService.UpdateFeedbackResponse(existing))
            {
                MessageBox.Show("Response updated successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                MessageBox.Show("Failed to update response.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void DeleteFeedback_Click(object sender, RoutedEventArgs e)
        {
            if (FeedbackGrid.SelectedItem is not Feedback selected)
            {
                MessageBox.Show("Please select a feedback to delete.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var confirm = MessageBox.Show($"Are you sure you want to delete feedback ID {selected.FeedbackId}?", "Confirm Delete", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (confirm == MessageBoxResult.Yes)
            {
                 if (_responseService.DeleteFeedbackResponseById(selected.FeedbackId) && _feedbackService.DeleteFeedbackByID(selected.FeedbackId))
                {
                    MessageBox.Show("Feedback deleted successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadFeedbackList();
                    ClearForm();
                }
                else
                {
                    MessageBox.Show("Failed to delete feedback.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void ClearForm_Click(object sender, RoutedEventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            txtUserId.Text = "";
            txtMessage.Text = "";
            cbEmoji.SelectedIndex = -1;
            FeedbackGrid.UnselectAll();
        }

        private void FeedbackGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (FeedbackGrid.SelectedItem is Feedback selected)
            {
                txtUserId.Text = selected.UserId.ToString();
                txtMessage.Text = selected.Message;
                foreach (ComboBoxItem item in cbEmoji.Items)
                {
                    if ((string)item.Tag == selected.Emoji)
                    {
                        cbEmoji.SelectedItem = item;
                        break;
                    }
                }
                var response = _responseService.GetResponseByFeedbackId(selected.FeedbackId);
                txtResponse.Text = response?.ResponseText ?? "";
            }
        }

        private void txtSearch_GotFocus(object sender, RoutedEventArgs e)
        {
            if (txtSearch.Text == "Search feedback...")
            {
                txtSearch.Text = "";
                txtSearch.Foreground = Brushes.Black;
            }
        }

        private void txtSearch_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSearch.Text))
            {
                txtSearch.Text = "Search feedback...";
                txtSearch.Foreground = Brushes.Gray;
            }
        }

        private void txtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (txtSearch.Text == "Search feedback...") return;

            var keyword = txtSearch.Text.Trim().ToLower();
            var result = fullFeedbackList
                .Where(f => f.Message.ToLower().Contains(keyword) || f.Emoji.Contains(keyword))
                .ToList();

            FeedbackGrid.ItemsSource = result;
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
    }
}
