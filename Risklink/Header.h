//
//  Header.h
//  Risklink
//
//  Created by 李想 on 2017/8/14.
//  Copyright © 2017年 李想. All rights reserved.
//

#ifndef Header_h
#define Header_h

/**
*  屏幕尺寸
*/
#define CGSCREEN CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5AND5S (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6AND6S (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6PAND6SP (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
/**
 *  首页
 */
#define NumberSection 3
#define ZeroSection 3
#define OneSection 1
#define screenHeightRadio (SCREEN_HEIGHT/(([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)?568.0:(568.0-20)))
/**
 *  间隔
 */
#define NavBarH 64
#define RLTitlesViewH 40
#define TabBarH 49
#define RLEventScale 1.5
#define halfHeight (SCREEN_HEIGHT-49-64)/2
#define oneHeight (SCREEN_HEIGHT-64-49)/10

/**
 *  通知
 */


/**
 *  判断
 */
//判断数组是否是空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//判断字典是否是空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//判断对象是否为空
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#define NOEMPTYSTRING(string) !kObjectIsEmpty(string)?string:@""



/**
 *  系统
 */
#define rootWindow [UIApplication sharedApplication].keyWindow//keywindow
#define RLUserDefaults [NSUserDefaults standardUserDefaults]//单例defaults
#define RLNotificationCenter [NSNotificationCenter defaultCenter]//单例通知中心
//app版本号
#define RLAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define RLSystemVersion [[UIDevice currentDevice] systemVersion]
//Document路径
#define RLDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//弱引用
#define RLWeakSelf(type)  __weak typeof(type) weak##type = type;
//角度转弧度
#define RLDegreesToRadian(x)      (M_PI * (x) / 180.0)
//弧度转角度
#define RLRadianToDegrees(radian) (radian * 180.0) / (M_PI)
//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:［NSBundle mainBundle]pathForResource:file ofType:ext］
//读取本地图片2
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
//读取本地图片3
#define ImageNamed(imagename) [UIImage imageNamed:imagename]


//定义文字字体
#define FONT(F) [UIFont systemFontOfSize:F]
#define PFFONT(F) [UIFont fontWithName:@"PingFangHK-Medium" size:F]
#define HCFONT(F) [UIFont fontWithName:@"HelveticaNeue-medium" size:F]


/**
 *
 */



/**
 *  Get
 */

#define HomeBaseURl @""
/**
 *  POST
 */
#define scanCardUrl @""
#define showHeadPathPrefix @""
//#define showHeadPathPrefix @"http://180.169.17.83:8888/"
//#define showHeadPathPrefix @"http://192.168.1.40:8888/"
//#define showHeadPathPrefix @"http://180.169.17.83:8888/"
//#define projectName @"/gugu"


/**
 *  颜色
 */
#define RLWriteToPlist(obj, filename) [obj writeToFile:[NSString stringWithFormat:@"/Users/mac/Desktop", filename] atomically:YES];

//三基色 透明度1
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//三基色与透明度
#define RGBA(r, g, b, a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

//随机色
#define RLRandomColor RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define Font(a) [UIFont systemFontOfSize:a]


#define VerColor RGB(0,209,176)
#define CerColor RGB(255,202,101)

//背景
//#define navbg [UIColor colorWithRed:0.f/255.f green:141.f/255.f blue:217.f/255.f alpha:1]
#define navbg [UIColor colorWithHexString:@"#459cee"]
#define TitleTC [UIColor colorWithHexString:@"#333333"]
#define SubTitleTC [UIColor colorWithHexString:@"#999999"]
#define bgColor [UIColor colorWithHexString:@"#f6f7fb"]

#define Color102 [UIColor colorWithRed:102.f/255.f green:102.f/255.f blue:102.f/255.f alpha:1]
#define Color87 [UIColor colorWithRed:87.f/255.f green:87.f/255.f blue:87.f/255.f alpha:1]
#define Color128 [UIColor colorWithRed:128.f/255.f green:128.f/255.f blue:128.f/255.f alpha:1]
#define Color153 [UIColor colorWithRed:153.f/255.f green:153.f/255.f blue:153.f/255.f alpha:1]
#define boderColor [UIColor colorWithRed:230.f/255.f green:230.f/255.f blue:230.f/255.f alpha:1]

#define darkColor   RGBA(0.0f, 0.0f, 0.0f, 0.2f)

#define APP_LABEL_TEXT_COLOR_1   RGB(159.0f, 159.0f, 159.0f)

#define APP_BUTTON_TEXT_COLOR   Color128
#define APP_STATE_COLOR     RGB(153.0f, 153.0f, 153.0f)
#define APP_CELL_TEXT_COLOR Color102

#define APP_CELL_DOWN_PART_COLOR RGB(250.0f, 247.0f, 248.0f)
#define APP_BLACK_OPACITY_BG_COLOR  RGBA(0.0f, 0.0f, 0.0f, 0.7f)
#define APP_PERCENTAGE_TEXT_COLOR   RGB(77.0f, 77.0f, 77.0f)
#define APP_CPMPANY_NAME_TEXT_COLOR RGB(102.0f, 102.0f, 102.0f)
#define APP_ORANGE_COLOR   RGBA(227.0f, 136.0f, 166.0f, 1.0f)
#define VERIFY_BUTTON_COLOR RGBA(0.0f, 141.0f, 217.0f, 1.0f)
#define APPROVE_CREDIT_COLOR    RGBA(245.0f, 147.0f, 49.0f, 1.0f)
#define DELETE_COLOR    RGBA(252.0f, 60.0f, 79.0f, 1.0f)

//Font size

#define APP_LABEL_TEXT_FONT_1   Font(12.0f)
#define APP_FONT_SMALLEST  APP_LABEL_TEXT_FONT_1
#define APP_FONT_STATUE     Font(10.0f)

#define APP_BUTTON_TEXT_FONT    Font(13.0f)
#define APP_INPUT_CELL_TITLE_FONT Font(13.0f)
#define APP_CELL_UP_TITLE_FONT  Font(13.0f)

#define APP_FONT_SMALL  Font(14.0f)
#define APP_FONT_NORMAL Font(18.0f)

#define APP_PERCENTAGE_FONT Font(23.0f)
#define APP_COMPANY_NAME_FONT Font(15.0f)

//table view tag
#define MINE_TABLE_VIEW_TAG 1001
#define MINE_BOX_TABLE_VIEW_TAG 1002

#define TAG_MY_CARD_PERSONAL_INFO_TABLE_VIEW 1003
#define TAG_MY_CARD_COMPANY_POPULARIZE_TABLE_VIEW  1004
#define TAG_ERROR_COLLECT_GROUP_TABLE_VIEW  1005

#define TAG_INFO_VERIFY_TABLE_VIEW  1006
#define TAG_BASE_INFO_TABLE_VIEW    1007

//collection view tag
#define TAG_ERROR_COLLECT_IMAGE_PICKER_COLLECTION_VIEW  2001

//singlton
#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject; \

#define PAGE_COUNT   @"10"

#define SQL_PREFIX_AND_OR_NOT(sql) [sql isEqualToString:@""] ? @"" : [NSString stringWithFormat:@" and %@", sql]

#endif /* Header_h */
