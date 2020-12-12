using System;
using System.Windows;

namespace CW._2020._23._09
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            var vm = new ViewModel();

            this.DataContext = vm;
            vm.PlayRequested += (sender, e) =>
            {
                this.mediaPlayer.Play();
            };
            vm.StopRequested += (sender, e) =>
            {
                this.mediaPlayer.Stop();
            };
            vm.PauseRequested += (sender, e) =>
            {
                this.mediaPlayer.Pause();
            };
            vm.SpeedRequested += (sender, e) =>
            {
                this.mediaPlayer.SpeedRatio = vm.MediaSpeed;
            };
            vm.SliderRequested += (sender, e) =>
            {
                long tmp = Convert.ToInt64(mediaPlayer.NaturalDuration.TimeSpan.Ticks * vm.SliderValue / vm.SliderMaximum);
                mediaPlayer.Position = new TimeSpan(tmp);
            };
            vm.TimeTickRequested += (sender, e) =>
            {
                DateTime time = new DateTime(mediaPlayer.Position.Ticks);
                vm.TimeContent = time.ToString(("HH:mm:ss"));

                vm.visualChange = true;
                if (mediaPlayer.NaturalDuration.HasTimeSpan)
                {
                    vm.SliderValue = mediaPlayer.Position.Ticks * Convert.ToInt32(vm.SliderMaximum) / mediaPlayer.NaturalDuration.TimeSpan.Ticks;
                    vm.SliderSelectionEnd = vm.SliderValue;
                }
                vm.visualChange = false;
            };
            vm.PositionRequested += (sender, e) =>
            {
                vm.Position = new DateTime(mediaPlayer.Position.Ticks);
            };
            vm.SetPositionRequested += (sender, e) =>
            {
                mediaPlayer.Position = new TimeSpan(vm.Position.Ticks);
            };
        }
    }
}