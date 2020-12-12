using Colors.Commands;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Threading;
using System.Xml.Serialization;

namespace CW._2020._23._09
{
    class ViewModel : INotifyPropertyChanged
    {
        #region "Properties"

        ICollection<MenuItem> menuItems = new ObservableCollection<MenuItem>();
        public IEnumerable<MenuItem> MenuItems => menuItems;
        public List<VideoInfo> videoInfos = new List<VideoInfo>();

        public event PropertyChangedEventHandler PropertyChanged;
        public event EventHandler PlayRequested;
        public event EventHandler StopRequested;
        public event EventHandler PauseRequested;
        public event EventHandler SpeedRequested;
        public event EventHandler SliderRequested;
        public event EventHandler TimeTickRequested;
        public event EventHandler PositionRequested;
        public event EventHandler SetPositionRequested;

        DispatcherTimer timer;
        DispatcherTimer timerMouse;
        public bool visualChange;
        private bool fullscreen;
        private bool wasPlayed;
        private bool isScreenshot;

        public ScaleTransform st;
        Bitmap image;

        [DllImport("user32.dll")]
        public static extern int ShowCursor(bool bShow);

        private double panelWindowX;
        public double PanelWindowX
        {
            get { return panelWindowX; }
            set
            {
                panelWindowX = value;
                if (!isScreenshot)
                    if (oldPanelWindowX != panelWindowX || oldPanelWindowY != PanelWindowY)
                        ShowCursor(true);
            }
        }

        private double panelWindowY;
        public double PanelWindowY
        {
            get { return panelWindowY; }
            set
            {
                panelWindowY = value;
                if (!isScreenshot)
                    if (oldPanelWindowX != panelWindowX || oldPanelWindowY != PanelWindowY)
                        ShowCursor(true);
            }
        }

        public double PanelX { get; set; }
        public double PanelY { get; set; }

        private double oldPanelWindowX { get; set; }
        private double oldPanelWindowY { get; set; }

        private Transform viewRenderTrasform;
        public Transform ViewRenderTrasform
        {
            get { return viewRenderTrasform; }
            set
            {
                viewRenderTrasform = value;
                OnPropertyChanged();
            }
        }

        private WindowStyle windowStyle;
        public WindowStyle WindowStyle
        {
            get { return windowStyle; }
            set
            {
                windowStyle = value;
                OnPropertyChanged();
            }
        }

        private WindowState windowState;
        public WindowState WindowState
        {
            get { return windowState; }
            set
            {
                windowState = value;
                OnPropertyChanged();
            }
        }

        private string timeContent;
        public string TimeContent
        {
            get { return timeContent; }
            set
            {
                timeContent = value;
                OnPropertyChanged();
            }
        }

        private string urlYT;
        public string UrlYT
        {
            get { return urlYT; }
            set
            {
                urlYT = value;
                OnPropertyChanged();
            }
        }

        private string browserAddress;
        public string BrowserAddress
        {
            get { return browserAddress; }
            set
            {
                browserAddress = value;
                OnPropertyChanged();
            }
        }

        private long sliderValue;
        public long SliderValue
        {
            get { return sliderValue; }
            set
            {
                sliderValue = value;
                if (!visualChange)
                {
                    this.PauseRequested?.Invoke(this, EventArgs.Empty);
                    this.SliderRequested?.Invoke(this, EventArgs.Empty);
                    SliderSelectionEnd = sliderValue;
                    this.PlayRequested?.Invoke(this, EventArgs.Empty);
                }
                OnPropertyChanged();
            }
        }

        private long sliderMaximum;
        public long SliderMaximum
        {
            get { return sliderMaximum; }
            set
            {
                sliderMaximum = value;
                OnPropertyChanged();
            }
        }

        private long sliderSelectionEnd;
        public long SliderSelectionEnd
        {
            get { return sliderSelectionEnd; }
            set
            {
                sliderSelectionEnd = value;
                OnPropertyChanged();
            }
        }

        private GridLength menuGridHeight;
        public GridLength MenuGridHeight
        {
            get { return menuGridHeight; }
            set
            {
                menuGridHeight = value;
                OnPropertyChanged();
            }
        }

        private GridLength gridsHeight;
        public GridLength GridsHeight
        {
            get { return gridsHeight; }
            set
            {
                gridsHeight = value;
                OnPropertyChanged();
            }
        }

        private string muteContent;
        public string MuteContent
        {
            get { return muteContent; }
            set
            {
                muteContent = value;
                OnPropertyChanged();
            }
        }

        private string borderText;
        public string BorderText
        {
            get { return borderText; }
            set
            {
                borderText = value;
                OnPropertyChanged();
            }
        }

        private bool audioIsEnabled;
        public bool AudioIsEnabled
        {
            get { return audioIsEnabled; }
            set
            {
                audioIsEnabled = value;
                OnPropertyChanged();
            }
        }

        private int audioMaximum;
        public int AudioMaximum
        {
            get { return audioMaximum; }
            set
            {
                audioMaximum = value;
                OnPropertyChanged();
            }
        }

        private int audioSelectionEnd;
        public int AudioSelectionEnd
        {
            get { return audioSelectionEnd; }
            set
            {
                audioSelectionEnd = value;
                OnPropertyChanged();
            }
        }

        private double mediaVolume;
        public double MediaVolume
        {
            get { return mediaVolume; }
            set
            {
                mediaVolume = value;
                OnPropertyChanged();
            }
        }

        private double audioValue;
        public double AudioValue
        {
            get { return audioValue; }
            set
            {
                audioValue = value;
                MediaVolume = audioValue / AudioMaximum;
                AudioSelectionEnd = Convert.ToInt32(audioValue);
                OnPropertyChanged();
            }
        }

        private string speedContent;
        public string SpeedContent
        {
            get { return speedContent; }
            set
            {
                speedContent = value;
                OnPropertyChanged();
            }
        }

        private string onTopText;
        public string OnTopText
        {
            get { return onTopText; }
            set
            {
                onTopText = value;
                OnPropertyChanged();
            }
        }

        private Uri mediaSource;
        public Uri MediaSource
        {
            get { return mediaSource; }
            set
            {
                mediaSource = value;
                OnPropertyChanged();
            }
        }

        private bool mediaIsMuted;
        public bool MediaIsMuted
        {
            get { return mediaIsMuted; }
            set
            {
                mediaIsMuted = value;
                OnPropertyChanged();
            }
        }

        private bool historyEnabled;
        public bool HistoryEnabled
        {
            get { return historyEnabled; }
            set
            {
                historyEnabled = value;
                OnPropertyChanged();
            }
        }

        private bool topmostState;
        public bool TopmostState
        {
            get { return topmostState; }
            set
            {
                topmostState = value;
                OnPropertyChanged();
            }
        }

        private Visibility toolBarVisibility;
        public Visibility ToolBarVisibility
        {
            get { return toolBarVisibility; }
            set
            {
                toolBarVisibility = value;
                OnPropertyChanged();
            }
        }

        private Visibility isMediaVisible;
        public Visibility IsMediaVisible
        {
            get { return isMediaVisible; }
            set
            {
                isMediaVisible = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(IsBrowserVisible));
            }
        }

        public Visibility IsBrowserVisible
        {
            get
            {
                if (IsMediaVisible == Visibility.Visible)
                    return Visibility.Hidden;
                else
                    return Visibility.Visible;
            }
        }

        public double MediaSpeed { get; set; }

        #endregion 

        #region "Commands"

        public DateTime Position { get; set; }

        private Command openVideo;
        public ICommand OpenVideo => openVideo;

        private Command openYTVideo;
        public ICommand OpenYTVideo => openYTVideo;

        private Command playVideo;
        public ICommand PlayVideo => playVideo;

        private Command pauseVideo;
        public ICommand PauseVideo => pauseVideo;

        private Command stopVideo;
        public ICommand StopVideo => stopVideo;

        private Command muteVideo;
        public ICommand MuteVideo => muteVideo;

        private Command fullScreen;
        public ICommand FullScreen => fullScreen;

        private Command speedVideo;
        public ICommand SpeedVideo => speedVideo;

        private Command borderlessMode;
        public ICommand BorderlessMode => borderlessMode;

        private Command hideAllControls;
        public ICommand HideAllControls => hideAllControls;

        private Command showAllControls;
        public ICommand ShowAllControls => showAllControls;

        private Command onTopMode;
        public ICommand OnTopMode => onTopMode;

        private ICommand mouseWheelCommand;
        public ICommand MouseWheelCommand => mouseWheelCommand = mouseWheelCommand ?? new Prism.Commands.DelegateCommand<MouseWheelEventArgs>(e => MouseWheelCommandExecute(e));

        private Command doubleClickFS;
        public ICommand DoubleClickFS => doubleClickFS;

        private Command makeScreenshot;
        public ICommand MakeScreenshot => makeScreenshot;

        private Command addInList;
        private bool isPlaying;

        public ICommand AddInList => addInList;

        #endregion

        public ViewModel()
        {
            if (File.Exists("videoInfos.xml"))
            {
                UpdateArrays();
            }

            if (videoInfos.Count > 0)
                historyEnabled = true;
            else
                historyEnabled = false;

            this.WindowStyle = WindowStyle.SingleBorderWindow;

            AudioIsEnabled = true;
            SpeedContent = "Speed: 1x";
            BorderText = "Hide borders";
            OnTopText = "Enable OnTop";
            AudioMaximum = 100;
            AudioValue = AudioMaximum;
            TimeContent = "00:00:00";
            MuteContent = "Mute";
            GridsHeight = new GridLength(2, GridUnitType.Star);
            MenuGridHeight = new GridLength(1, GridUnitType.Star);
            SliderMaximum = 100;
            visualChange = false;
            fullscreen = false;
            wasPlayed = false;
            isScreenshot = false;
            TopmostState = false;
            st = new ScaleTransform();
            ViewRenderTrasform = st;
            IsMediaVisible = Visibility.Visible;

            openVideo = new DelegateCommand(() =>
            {
                BrowserAddress = "";
                IsMediaVisible = Visibility.Visible;
                GridsHeight = new GridLength(2, GridUnitType.Star);
                ToolBarVisibility = Visibility.Visible;

                PauseVideo.Execute(null);
                ShowCursor(true);

                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "(*.mp4)|*.mp4|(*.avi)|*.avi|(*.gif)|*.gif";

                if (openFileDialog.ShowDialog() == true)
                {
                    SaveVideoInfos();

                    if (File.Exists("videoInfos.xml"))
                    {
                        videoInfos.Clear();
                        menuItems.Clear();

                        UpdateArrays();

                        if (videoInfos.Count > 0)
                            HistoryEnabled = true;
                        else
                            HistoryEnabled = false;
                    }

                    MediaSource = new Uri(openFileDialog.FileName);
                    if (timer == null)
                        timerStart();
                    PlayVideo.Execute(null);
                }
            });
            playVideo = new DelegateCommand(() =>
            {
                if (this.PlayRequested != null && MediaSource != null)
                {
                    this.PlayRequested(this, EventArgs.Empty);
                    wasPlayed = true;
                    isPlaying = true;
                }
            });
            pauseVideo = new DelegateCommand(() =>
            {
                if (MediaSource != null)
                {
                    this.PauseRequested?.Invoke(this, EventArgs.Empty);
                    isPlaying = false;
                }
            });
            stopVideo = new DelegateCommand(() =>
            {
                if (MediaSource != null)
                {
                    this.StopRequested?.Invoke(this, EventArgs.Empty);
                    isPlaying = false;
                }
            });
            muteVideo = new DelegateCommand(() =>
            {
                if (MuteContent.ToString() == "Mute")
                {
                    MediaIsMuted = true;
                    MuteContent = "Unmute";
                    AudioIsEnabled = false;
                }
                else
                {
                    MediaIsMuted = false;
                    MuteContent = "Mute";
                    AudioIsEnabled = true;
                }
            });
            fullScreen = new DelegateCommand(() =>
            {
                if (wasPlayed || BrowserAddress != "")
                {
                    if (fullscreen == false)
                        if (MediaSource != null || BrowserAddress != "")
                        {
                            WindowStyle = WindowStyle.None;
                            WindowState = WindowState.Maximized;
                            fullscreen = true;
                            GridsHeight = new GridLength(0, GridUnitType.Star);
                            MenuGridHeight = new GridLength(0, GridUnitType.Star);
                            ToolBarVisibility = Visibility.Hidden;
                            ShowCursor(true);
                            MessageBox.Show("Double click to exit.");
                        }
                }
                else
                {
                    MessageBox.Show("No video to play! Please, load it.");
                }
            });
            speedVideo = new DelegateCommand(() =>
            {
                if (SpeedContent == "Speed: 1x")
                {
                    SpeedContent = "Speed: 2x";
                    MediaSpeed = 2;
                    this.SpeedRequested?.Invoke(this, EventArgs.Empty);
                }
                else if (SpeedContent == "Speed: 2x")
                {
                    SpeedContent = "Speed: 0.5x";
                    MediaSpeed = 0.5;
                    this.SpeedRequested?.Invoke(this, EventArgs.Empty);
                }
                else if (SpeedContent == "Speed: 0.5x")
                {
                    SpeedContent = "Speed: 1x";
                    MediaSpeed = 1;
                    this.SpeedRequested?.Invoke(this, EventArgs.Empty);
                }
            });
            doubleClickFS = new DelegateCommand(() =>
            {
                if (wasPlayed || BrowserAddress != "")
                    if (fullscreen == false)
                    {
                        if (MediaSource != null || BrowserAddress != "")
                        {
                            WindowStyle = WindowStyle.None;
                            WindowState = WindowState.Maximized;
                            fullscreen = true;
                            GridsHeight = new GridLength(0, GridUnitType.Star);
                            MenuGridHeight = new GridLength(0, GridUnitType.Star);
                            ToolBarVisibility = Visibility.Hidden;
                            ShowCursor(true);
                            MessageBox.Show("Double click to exit.");
                            BorderText = "Hide borders";
                        }
                    }
                    else if (MediaSource != null || BrowserAddress != "")
                    {
                        WindowStyle = WindowStyle.SingleBorderWindow;
                        WindowState = WindowState.Normal;
                        fullscreen = false;
                        if (MediaSource != null)
                            GridsHeight = new GridLength(2, GridUnitType.Star);
                        MenuGridHeight = new GridLength(1, GridUnitType.Star);
                        ToolBarVisibility = Visibility.Visible;
                    }
            });
            borderlessMode = new DelegateCommand(() =>
            {
                if (!fullscreen)
                    if (BorderText == "Hide borders")
                    {
                        WindowStyle = WindowStyle.None;
                        BorderText = "Show borders";
                    }
                    else
                    {
                        WindowStyle = WindowStyle.SingleBorderWindow;
                        BorderText = "Hide borders";
                    }
            });
            hideAllControls = new DelegateCommand(() =>
            {
                if (!fullscreen)
                {
                    MenuGridHeight = new GridLength(0, GridUnitType.Star);
                    GridsHeight = new GridLength(0, GridUnitType.Star);
                    ToolBarVisibility = Visibility.Hidden;
                }
            });
            showAllControls = new DelegateCommand(() =>
            {
                if (!fullscreen && IsMediaVisible == Visibility.Visible)
                {
                    MenuGridHeight = new GridLength(1, GridUnitType.Star);
                    GridsHeight = new GridLength(2, GridUnitType.Star);
                    ToolBarVisibility = Visibility.Visible;
                }
                else if (!fullscreen)
                {
                    MenuGridHeight = new GridLength(1, GridUnitType.Star);
                }
            });
            onTopMode = new DelegateCommand(() =>
            {
                if (OnTopText == "Enable OnTop")
                {
                    TopmostState = true;
                    OnTopText = "Disable OnTop";
                }
                else
                {
                    TopmostState = false;
                    OnTopText = "Enable OnTop";
                }
            });
            makeScreenshot = new DelegateCommand(() =>
            {
                if (MediaSource != null)
                {
                    isScreenshot = true;
                    this.PauseRequested?.Invoke(this, EventArgs.Empty);
                    var saveFileDialog = new SaveFileDialog();
                    saveFileDialog.Filter = "(*.png)|*.png";
                    if (saveFileDialog.ShowDialog() == true)
                    {
                        fullscreen = true;
                        WindowStyle = WindowStyle.None;
                        WindowState = WindowState.Maximized;
                        GridsHeight = new GridLength(0, GridUnitType.Star);
                        ToolBarVisibility = Visibility.Hidden;
                        ShowCursor(false);
                        Thread.Sleep(500);

                        MakeScreenshotWindow();

                        image.Save(saveFileDialog.FileName, ImageFormat.Png);

                        fullscreen = false;
                        WindowStyle = WindowStyle.SingleBorderWindow;
                        WindowState = WindowState.Normal;
                        GridsHeight = new GridLength(1, GridUnitType.Star);
                        ToolBarVisibility = Visibility.Visible;
                        ShowCursor(true);

                        MessageBox.Show("Screenshot saved!");
                    }
                    this.PlayRequested?.Invoke(this, EventArgs.Empty);
                    isScreenshot = false;
                }
                else
                {
                    MessageBox.Show("No video to make screenshot! Please, load it.");
                }
            });
            openYTVideo = new DelegateCommand(() =>
            {
                SaveVideoInfos();

                if (File.Exists("videoInfos.xml"))
                {
                    videoInfos.Clear();
                    menuItems.Clear();

                    UpdateArrays();

                    if (videoInfos.Count > 0)
                        HistoryEnabled = true;
                    else
                        HistoryEnabled = false;
                }

                MediaSource = null;
                StopVideo.Execute(null);
                IsMediaVisible = Visibility.Hidden;
                GridsHeight = new GridLength(0, GridUnitType.Star);
                ToolBarVisibility = Visibility.Hidden;

                if (urlYT.Contains($"https://www.youtube.com/watch?v="))
                {
                    var url = UrlYT.Replace($"https://www.youtube.com/watch?v=", "");

                    url = $"https://www.youtube.com/embed/" + url;

                    BrowserAddress = url;
                }
                else
                {
                    MessageBox.Show("Wrong URL!");
                }
            });
            addInList = new DelegateCommand(SaveVideoInfos);

            timerMouse = new DispatcherTimer();
            timerMouse.Tick += new EventHandler(timerMouseTick);
            timerMouse.Interval = new TimeSpan(0, 0, 0, 0, 10);
            timerMouse.Start();
        }

        #region Methods

        private void UpdateArrays()
        {
            var formatter = new XmlSerializer(typeof(VideoInfo[]));

            VideoInfo[] collection;
            using (var fs = new FileStream("videoInfos.xml", FileMode.Open))
            {
                collection = formatter.Deserialize(fs) as VideoInfo[];
            }

            foreach (var item in collection)
            {
                var menuItem = new MenuItem();
                if (timer != null)
                    timerStart();
                menuItem.Foreground = new SolidColorBrush(System.Windows.Media.Color.FromRgb(0, 0, 0));
                menuItem.Header = item.Path + " | " + item.Position.ToString(("HH:mm:ss"));
                menuItem.Command = new DelegateCommand(() =>
                {
                    BrowserAddress = "";
                    IsMediaVisible = Visibility.Visible;
                    GridsHeight = new GridLength(2, GridUnitType.Star);
                    ToolBarVisibility = Visibility.Visible;

                    if (File.Exists((new Uri(item.Path)).LocalPath))
                    {
                        SaveVideoInfos();

                        if (File.Exists("videoInfos.xml"))
                        {
                            videoInfos.Clear();
                            menuItems.Clear();

                            UpdateArrays();
                        }

                        MediaSource = new Uri(item.Path);
                        this.Position = item.Position;

                        this.SetPositionRequested?.Invoke(this, EventArgs.Empty);
                        SliderSelectionEnd = sliderValue;

                        if (timer == null)
                            timerStart();

                        PlayVideo.Execute(null);
                    }
                    else
                    {
                        videoInfos.Remove(videoInfos.Where(x => x.Path == item.Path).FirstOrDefault());
                        SaveVideoInfos();
                        if (File.Exists("videoInfos.xml"))
                        {
                            videoInfos.Clear();
                            menuItems.Clear();

                            UpdateArrays();

                            if (videoInfos.Count > 0)
                                HistoryEnabled = true;
                            else
                                HistoryEnabled = false;
                        }
                        MessageBox.Show("File not found!");
                    }
                });

                menuItems.Add(menuItem);
            }
            videoInfos.AddRange(collection);
        }

        private void SaveVideoInfos()
        {
            if (mediaSource != null)
            {
                this.PositionRequested?.Invoke(this, EventArgs.Empty);

                if (videoInfos.Where(x => x.Path == MediaSource.ToString()).FirstOrDefault() != null)
                {
                    videoInfos.Where(x => x.Path == MediaSource.ToString()).First().Position = this.Position;
                }
                else
                {
                    videoInfos.Add(new VideoInfo { Path = MediaSource.ToString(), Position = this.Position });
                }
            }

            var formatter = new XmlSerializer(typeof(VideoInfo[]));

            using (var fs = new FileStream("videoInfos.xml", FileMode.Create))
            {
                formatter.Serialize(fs, videoInfos.ToArray());
            }
        }

        private void MakeScreenshotWindow()
        {
            Bitmap bmp = new Bitmap(System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width, System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height);
            using (Graphics g = Graphics.FromImage(bmp))
            {
                g.CopyFromScreen(0, 0, 0, 0, System.Windows.Forms.Screen.PrimaryScreen.Bounds.Size);
                image = bmp;
            }
        }

        private void MouseWheelCommandExecute(MouseWheelEventArgs e)
        {
            if (!isScreenshot)
            {
                st.CenterX = PanelX;
                st.CenterY = PanelY;
                if (e.Delta > 0) st.ScaleX = st.ScaleX *= 1.1;
                if (e.Delta < 0 && st.ScaleX > 1) st.ScaleX = st.ScaleX /= 1.1;
                st.ScaleY = st.ScaleX;
            }
        }

        private void timerStart()
        {
            timer = new DispatcherTimer();
            timer.Tick += new EventHandler(timerTick);
            timer.Interval = new TimeSpan(0, 0, 0, 1);
            timer.Start();
        }

        private void timerTick(object sender, EventArgs e)
        {
            this.TimeTickRequested?.Invoke(this, EventArgs.Empty);
        }

        private void timerMouseTick(object sender, EventArgs e)
        {
            if (isPlaying)
            {
                if (oldPanelWindowX == PanelWindowX && oldPanelWindowY == PanelWindowY)
                    ShowCursor(false);
            }

            oldPanelWindowX = PanelWindowX;
            oldPanelWindowY = PanelWindowY;
        }

        protected void OnPropertyChanged([CallerMemberName] string name = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }

        #endregion
    }
}