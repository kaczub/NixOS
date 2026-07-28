{...}: {
  programs.brave = {
    enable = true;
  };

  # Tworzy plik JSON z politykami bezpośrednio w katalogu Brave
  home.file.".config/brave-browser/policies/managed/policies.json".text = builtins.toJSON {
    MemorySaverModeSavings = 1;
    TranslateEnabled = false;
    PaymentMethodQueryEnabled = false;
    PrivacySandboxFingerprintingProtectionEnabled = true;
    BlockThirdPartyCookies = true;
    HomepageIsNewTabPage = true;
    LensRegionSearchEnabled = false;
    LensDesktopNTPSearchEnabled = false;
    PromptForDownloadLocation = false;
    EnableMediaRouter = false;
    BookmarkBarEnabled = true;
    SafeBrowsingProtectionLevel = 1;
    MediaRecommendationsEnabled = false;
    QuicAllowed = false;
    BackgroundModeEnabled = false;

    BraveRewardsDisabled = true;
    BraveWalletDisabled = true;
    BraveVPNDisabled = 1;
    BraveAIChatEnabled = false;
    TorDisabled = true;

    DnsOverHttpsMode = "off";
    PrivacySandboxPromptEnabled = false;
    GeminiSettings = 1;
    GenAiDefaultSettings = 2;
    GenAiLensOverlaySettings = 2;
    GenAILocalFoundationalModelSettings = 1;
    FeedbackSurveysEnabled = false;
    NewTabPageLocation = "https://search.brave.com";

    CloudProfileReportingEnabled = false;
    CloudReportingEnabled = false;
    MetricsReportingEnabled = false;
    ReportExtensionsAndPluginsData = false;
    SuppressUnsupportedOSWarning = true;
    ReportMachineIDData = false;
    ReportPolicyData = false;
    ReportUserIDData = false;
    ReportVersionData = false;

    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    AutofillPredictionSettings = 2;
    PasswordLeakDetectionEnabled = false;
    PasswordSharingEnabled = false;
    PasswordManagerEnabled = false;

    LensOverlaySettings = 1;
    PromotionalTabsEnabled = false;
    PromotionsEnabled = false;
    HelpMeWriteSettings = 2;

    PrivacySandboxAdTopicsEnabled = false;
    PrivacySandboxSiteEnabledAdsEnabled = false;
    PrivacySandboxAdMeasurementEnabled = false;
    SearchSuggestEnabled = false;
    SafeBrowsingSurveysEnabled = false;
    ShoppingListEnabled = false;
    WebRtcEventLogCollectionAllowed = false;
    SafeBrowsingExtendedReportingEnabled = false;
    UserFeedbackAllowed = false;
    UserDataSnapshotRetentionLimit = 0;
    SyncDisabled = true;
    SpellcheckEnabled = false;
    SpellCheckServiceEnabled = false;
    ShowFullUrlsInAddressBar = true;
    BrowserSignin = 0;
    UrlKeyedMetricsAllowed = false;
    ShowHomeButton = true;
    UrlKeyedAnonymizedDataCollectionEnabled = false;
    WebRtcIPHandling = "disable_non_proxied_udp";
  };
}
