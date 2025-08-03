using BusinessObject;
using Service;
using System;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;

namespace QuitHubWPF_App
{
    public partial class FeedbackWindow : Window
    {
        private readonly IFeedbackService _feedbackService;
        private readonly User _currentUser;
        private ObservableCollection<Feedback> _feedbackList;

        public FeedbackWindow(User currentUser)
        {
            InitializeComponent();
            _currentUser = currentUser;
            _feedbackService = new FeedbackService();
            LoadFeedbacks();
        }

        private void LoadFeedbacks()
        {
            var feedbacks = _feedbackService
                .GetFeedbackById(_currentUser.UserId)
                .Select(fb =>
                {
                    fb.FeedbackResponses = fb.FeedbackResponses ?? new List<FeedbackResponse>();
                    return fb;
                }).ToList();

            _feedbackList = new ObservableCollection<Feedback>(feedbacks);
            lstFeedbacks.ItemsSource = _feedbackList;
        }

        private void SubmitFeedback_Click(object sender, RoutedEventArgs e)
        {
            var emoji = EmojiPanel.Children
                .OfType<RadioButton>()
                .FirstOrDefault(r => r.IsChecked == true)?.Tag?.ToString();

            if (string.IsNullOrWhiteSpace(emoji) || string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                MessageBox.Show("Please select an emoji and enter your feedback.", "Validation", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var feedback = new Feedback
            {
                UserId = _currentUser.UserId,
                Emoji = emoji,
                Message = txtMessage.Text.Trim(),
                SentAt = DateTime.Now
            };

            if (_feedbackService.AddFeedback(feedback))
            {
                feedback.FeedbackResponses = new List<FeedbackResponse>();
                _feedbackList.Add(feedback);
                txtMessage.Clear();
                foreach (RadioButton rb in EmojiPanel.Children.OfType<RadioButton>())
                    rb.IsChecked = false;
            }
            else
            {
                MessageBox.Show("Failed to submit feedback.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            new LoginWindow().Show();
            this.Close();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            new UserWindow(_currentUser.UserId).Show();
            this.Close();
        }

        private void ResponseLabel_Click(object sender, MouseButtonEventArgs e)
        {
            if (sender is TextBlock tb && tb.DataContext is Feedback fb && fb.FeedbackResponses.Any())
            {
                var r = fb.FeedbackResponses.First();
                var responseWindow = new FeedbackResponseWindow(r);
                responseWindow.Owner = this;
                responseWindow.ShowDialog();
            }
        }
    }
}
