
## Below are the changes I have made to project in order to achieve TASK GOALS

## First i added  fully customized Network layers that have internet connection , encryptions if needed, generic parameters , SwiftyJSON , Alamodire , Rxswift

## In Appdelegate I have following changes
 if IOS Version is 13 Or Fewer  open Root router 
 
## In Scenedelegate I have following changes
 if IOS Version is 13 Or Newer  open Root router 

## In Root Router i root to main view
 
## Info Plist i added Base url and some properies 
 
 ## I used 'Viper' Articture that code moduarity and code encapsulation useing 'Delegation' design pattern 
 
 ## In Viper i use View , Presenter , interactor , wireFrame , contract , models
 
 ## View : update UI
 ## Presenter: controls view and interactor
 ##Interactor: has two protcols input and output . call web server , store data
 ##wireFrame : can navigate between views and pass Data
 
## i used Skeleton pod to show user that app load Data

## i used SDWebImage:to load images

## Then i Moved to List View that i get Product from Server with limit and Scroll down i call server again and update Data

## If i select product move to next view 'List Details'  and pass Data that add image as header and 3 labels if scrolls this header streachs


## Final : i wrote some unit Testing that test method calls api 
