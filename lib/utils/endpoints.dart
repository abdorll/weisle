const apiKey = 'Weizle-j3dj_rurnnxnnxnjyriWiemfnkmkmzle==';





const baseUrl = 'https://weizle.com/apis';
const customerBaseUrlKey = '$baseUrl/v1/cust';
const emergencyBaseUrlKey = '$baseUrl/v1/setup';
const subscriptionBaseUrlKey = '$baseUrl/v1/trans';

//---------------------------------------CUSTOMERS RELATED APIS
const registerurl = '$customerBaseUrlKey/uReg';
const signInurl = '$customerBaseUrlKey/userAuth';
const setSqaurl = '$customerBaseUrlKey/setSqa';
const acctLookupurl = '$customerBaseUrlKey/acctLookup';
const resetPassurl = '$customerBaseUrlKey/resetPass';
const editProfileurl = '$customerBaseUrlKey/editProfile';
const notificationServiceurl = '$customerBaseUrlKey/notificationService';
const getNotificationurl = '$customerBaseUrlKey/getNotification/';

//---------------------------------------EMERGENCY SETUP
const getAllCategoriesurl = '$emergencyBaseUrlKey/getEcat';
const setupEmergurl = '$emergencyBaseUrlKey/setupEmerg';
const premiumPlanurl = '$emergencyBaseUrlKey/premiumPlan/';
const createSuburl = '$emergencyBaseUrlKey/createSub';
const confirmSubPlnurl = '$emergencyBaseUrlKey/confirmSubPln';

//---------------------------------------SUBSCRIPTION
const allSubHistoryurl = '$subscriptionBaseUrlKey/allSubHistory/';
const subHistoryByDateurl = '$subscriptionBaseUrlKey/subHistoryByDate/';
