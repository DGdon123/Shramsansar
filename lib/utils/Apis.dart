class Apis {
  // static String BASE_URL = 'http://103.175.192.138/api/';
  static String BASE_URL = 'https://shramsansar.koshi.gov.np/api/';
  static String IMAGE_URL = 'https://shramsansar.koshi.gov.np/';
  static String URL = 'https://shramsansar.koshi.gov.np';
  // static String latestJoburl = "http://139.59.21.174/api/latest/trainings";
  static String latestJoburl = "https://shramsansar.koshi.gov.np/api/latest/jobs";
  static String latestTrainingUrl =
      "https://shramsansar.koshi.gov.np/api/latest/trainings";

  /// Auth
  static String LOGIN_URI = 'jobseeker/login';
  static String FOR_GET_PASSWORD = 'forget-password';
  static String CHNAGE_PASSWORD = 'reset-password';
  static String LOG_OUT_URI = 'logout';
  static String REGISTER = 'jobseeker/register';
  static String UPDATE_PROFILE = 'update/user/profile/';
  static String VIEW_ALL_JOBS_CACEGORY = 'category';
  static String DOCOMENT_TYPE = 'document-type';
  static String GENSER = 'gender';

  ///Jobs
  static String VIEW_ALL_JOBS = 'view-all/jobs?page=';
  static String VIEW_SEARCH_JOBS = 'search/jobs?';
  static String VIEW_SINGLE_JOB = 'view/job/';
  static String JOB_APPLAY_F = 'job/';
  static String JOB_APPLAY_L = '/apply';

  ///Location
  static String PRODESH = 'pradesh';
  static String DISTRICTS = 'districts/';
  static String WARD = 'ward';

  ///Notice and News
  static String NEW_NOTICE = 'news?page=';
  static String NEW_NOTICE_SINGLE = 'news/details/';
  static String SEARCH_NEW_NOTICE_F = 'news-notice/search?title=';
  static String SEARCH_NEW_NOTICE_L = '&type=';

  ///ServiceProviders
  static String VIEW_ALL_Essp = 'get/essp?page=';
  static String getAllESSP = 'get/essp=';
  static String ESSP_SERVICE_PROVIDER_DETAILS = 'serviceprovider/details/';
  static String VIEW_ALL_Tsp = 'get/tsp?page=';
  static String TSP_DETAILS = 'tsp/details/';

  ///Trainings
  static String VIEW_ALL_TRAININGS = 'view-all/trainings?page=';
  static String VIEW_SINGLE_TRAININGS = 'view/training/';
  static String TRAININGS_CATEGORY = 'training/category';
  static String TRAINING_APPLLAY_F = 'training/';
  static String TRAINING_APPLLAY_L = '/apply';
  static String VIEW_SEARCH_TRAINING = 'search/trainings';
  static String MUNICIPALITIES = 'municipalities/';
  static String MUNICIPALITIES_All = 'municipalities';

  ///Notification
  static String NOTIFICATION_URI = 'notifications';

  ///Profile
  static String MY_PROFILE = "user/profile";
  static String SKILLS = "skills";
  static String EDUCATION = "education";

  static String POST_ABOUT_ME = "store/aboutYou";

  static String POST_EDUCATION = "store/education";
  static String UPDATE_EDUCATION = "edit/education/";
  static String DELETE_EDUCATION = "delete/education/";

  static String POST_EXPERINCE = "store/experience";
  static String DELETE_EXPERINCE = "delete/experience/";

  static String POST_TRANINGS = "store/training";
  static String UPDATE_TRANINGS = "update/training/";
  static String DELETE_TRANINGS = "delete/training/";

  static String POST_SKILL = "store/skill";
  static String DELETE_SKILL = "delete/skill/";

  static String POST_LAMGUAGE = "store/language";
  static String UPDATE_LAMGUAGE = "update/language/";
  static String DELETE_LAMGUAGE = "delete/language/";

  /// employ loacation
  static String PRODESH_EM = 'pradesh';
  static String DISTRICTS_EM = 'districts/';

  static String POST_LOCATION = 'store/preferenceLocation';
  static String UPDATE_LOCATION = 'update/preferenceLocation/';
  static String DELETE_LOCATION = 'delete/preferenceLocation/';

  static String SPESIAL_ADD = 'store/specialization';
  static String GET_SOCIAL_NAME = 'social-account';
  static String DELETE_SOCIAL = 'delete/socialAccount/';
  static String ADD_SOCIAL = 'store/socialAccount';
  static String GET_CAST = 'cast';
}
