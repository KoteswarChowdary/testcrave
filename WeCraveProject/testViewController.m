//
//  testViewController.m
//  WeCraveProject
//
//  Created by hari on 24/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

@synthesize scroller,nameField,passWordField,ageField,myData;
dispatch_queue_t queue;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLayoutSubviews {
    self.scroller.contentSize = CGSizeMake(320, 800);
}


- (void)viewDidLoad

{
    [super viewDidLoad];
    NSString *num = @"99";
    // For Underline the Buttons:
  //  ------------------------------------------------
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:@"The Quick Brown Fox"];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    [self.button setAttributedTitle:commentString forState:UIControlStateNormal];
  //  ---------------------------------------------------
   //
    
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/Koteswar/paytest/price.php?ID=%@",num];
    
    NSURL *myURL = [[NSURL alloc]initWithString:urlStr];
    
    // we'll receive raw data so we'll create an NSData Object with it
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    NSLog(@"data in mydata is %@",myData);
        id myjson = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
        // NSArray *jsonArray = (NSArray *)myJSON;
        jsonArray = [myjson objectForKey:@"admin"];
        NSLog(@"data in array is %@",jsonArray);

    
    _blockAsVariable = ^(void)
    {
        return @"this block is a class variable";
    };
    
    float block = ^(float a, float b)
    {
        return a+b;
    }(1,2);
    
    NSLog(@"block value is %f",block);
    //-------------> using externav variable in block;
    
    float f = 10;
    float (^blockinside)(void) = ^(void){
        return f+10;
        
        
    };
    NSLog(@"data is %f", blockinside());
    
    [self testBlockMethod];
    
    [self addNumber:5 withNumber:9 andCompletionHandler:^(int result) {
        NSLog(@"%d",result);
    }];
    [self.view addSubview:scroller];
    self.labelData.text = self.getStr;
    queue = dispatch_queue_create("com.koti.queue", nil);
    
//    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 220, 220)];
//   [ self.view addSubview:image];
//    image.image = [UIImage imageNamed:@"gift.png"];
//   
    
    NSString *myString = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/Koteswar/admin.php"];
    
    
    
   NSURL *url = [NSURL URLWithString:myString];
   
    myData = [NSData dataWithContentsOfURL:url];
    NSLog(@"raw data is string is %@",myData);

    NSString* aStr;
   // aStr = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
     aStr = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    
    NSLog(@"raw data is string is %@",aStr);
    
   NSError *error1;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:[aStr  dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error1];
    NSLog(@"data in jsondata is %@",jsonData);
   
    
    
//    NSError *jsonError = nil;
//    id jsonObject = [NSJSONSerialization JSONObjectWithData:myData options:kNilOptions error:&jsonError];
//    
//    if ([jsonObject isKindOfClass:[NSArray class]]) {
//        NSLog(@"its an array!");
//        NSArray *jsonArray = (NSArray *)jsonObject;
//        NSLog(@"jsonArray - %@",jsonArray);
//    }
//    else {
//        NSLog(@"its probably a dictionary");
//        NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
//        NSLog(@"jsonDictionary - %@",jsonDictionary);
//    }
// 
    
//    NSURL *myURL = [NSURL URLWithString:@"http://192.168.1.9:8080/json/hello"];
//    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
//    NSURLConnection *myConnection = [NSURLConnection connectionWithRequest:myRequest delegate:self];
//    
    
  // NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:myData options:kNilOptions error:&error1];
 //NSMutableArray *jsonData = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:myData options:kNilOptions error:&error1];
   //array = [[NSMutableArray alloc]init];
   //array = (NSMutableArray *)jsonData;
   //array = [jsonData objectForKey:@"categories"];
  //  NSLog(@"data in array is %@",array);
  //  NSDictionary *dict12 = [array objectAtIndex:1];
  
  // NSLog(@"dat in array object 1 is %@",dict12);
    
  
    // NSDictionary *d12 = [dict12 valueForKey:@"image"];
     //  NSLog(@"id for category is %@",d12);
   
    //NSArray *arr12 = [dict12 objectForKey:@"subcategory"];
    
    //NSLog(@"subcategory data is %@",arr12);
    
   // NSDictionary *d13 = [array valueForKey:@"id"];
    
   // NSLog(@" value name in sub_name is %@",d13);
    
 
//    
//    NSString *urlString = [NSString stringWithFormat:@"%@",[[array objectAtIndex:1]valueForKey:@"image"]];
//    NSLog(@"data in urlstring is %@",urlString);
//    NSURL *urlone = [NSURL URLWithString:urlString];
//    NSData *newData = [NSData dataWithContentsOfURL:urlone];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50, 160, 160)];
//    imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"imageBackground.png"]];
//    [imageView setImage:[UIImage imageWithData:newData]];
//    [scroller addSubview:imageView]; 
    
    }

 /*
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
    int errorCode = httpResponse.statusCode;
    NSString *fileMIMEType = [[httpResponse MIMEType] lowercaseString];
    NSLog(@"response is %d, %@", errorCode, fileMIMEType);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"data is %@", data);
     NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"string is %@", myString);
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{ // inform the user
           NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
        [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection

{ // do something with the data // receivedData is declared as a method instance elsewhere
    NSLog(@"Succeeded!");
}
    

    //NSDictionary *dict12 = [array objectAtIndex:indexpath.row];
    
   // NSLog(@"data is ..... is %@",dict12);
   // NSString *urlString = [NSString stringWithFormat:@"%@",[array objectAtIndex:3]];
    // NSLog(@"data in urlstring is %@",urlString);
   //  NSURL *urlone = [NSURL URLWithString:urlString];
    
   // urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
   // NSData *newData = [NSData dataWithContentsOfURL:urlone];
   // UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50, 120, 150)];
    
   // [imageView setImage:[UIImage imageWithData:newData]];
    //[self.view addSubview:imageView];


    
    
    
    
    
    
    
    
    //dictionary = (NSMutableDictionary*)array;
  
    
   // NSLog(@"data in inner data is %@",arr);
    
    
      //  NSString *title_data = [dict1 objectForKey:@"model"];
       // NSString *thumbnail_data = [dataDict objectForKey:@"thumbnail"];
       // NSString *author_data = [dataDict objectForKey:@"author"];
        
       // NSLog(@"dat ai %@",title_data);
        
        
        
        

        
        
        //dictionary = [NSDictionary dictionaryWithObjectsAndKeys:title_data, title,thumbnail_data, thumbnail,author_data,author,
             //         nil];
        //[myObject addObject:dictionary];
    
    
    //NSString *urlString = [NSString stringWithFormat:@"%@",[jsonData objectAtIndex:0]];
   // NSLog(@"data in urlstring is %@",urlString);
   // NSURL *urlone = [NSURL URLWithString:urlString];
    //NSData *newData = [NSData dataWithContentsOfURL:urlone];
    //UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50, 120, 150)];
    
    //[imageView setImage:[UIImage imageWithData:newData]];
    //[self.view addSubview:imageView];
 
    
  
    NSString *string = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/craveec/image/cache/data/fentastic work-100x100.png"];
    string= [string stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    
   // NSString *myString = [NSString stringWithFormat:@"http://ielmo.xtreemhost.com/array.php"];
    
   // NSURL *url = [NSURL URLWithString:string];
    
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:string]];
   //NSData *myData = [NSData dataWithContentsOfURL:url];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 120, 150)];
    
    [imageView setImage:[UIImage imageWithData:mydata]];
    [self.view addSubview:imageView];

   
    NSError *error1;
    
    NSMutableArray *jsonData = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:myData options:kNilOptions error:&error1];
    NSLog(@"data in jsondata is %@",jsonData);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 120, 150)];
    
    [imageView setImage:[UIImage imageWithData:newData]];
    [self.view addSubview:imageView];
    
   
    
    
    NSString *urlString = [NSString stringWithFormat:@"%@",[jsonData objectAtIndex:0]];
    NSLog(@"data in urlstring is %@",urlString);
    NSURL *urlone = [NSURL URLWithString:urlString];
    NSData *newData = [NSData dataWithContentsOfURL:urlone];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 120, 150)];
    
    [imageView setImage:[UIImage imageWithData:newData]];
    [self.view addSubview:imageView];
  
   
  


*/



// Delagate Method of MFMailComposerViewController

- (IBAction)mailButton:(id)sender {
    
    // Email Subject
    NSString *emailTitle = @"Test Email";
    // Email Content
    NSString *messageBody = @"iOS programming is so fun!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"support@appcoda.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)Save:(id)sender {
    NSString *firstName = [nameField text];
    NSString *lastName  = [passWordField text];
    long age = [[ageField text]integerValue];
    NSUserDefaults *userDefault1 = [NSUserDefaults standardUserDefaults];
    [userDefault1 setValue:@"koti" forKey:@"Fname"];
    [userDefault1 synchronize];
    [self result];
    
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:firstName forKey:@"FirstName"];
    [userDefault setObject:lastName forKey:@"PassWord"];
    [userDefault setInteger:age forKey:@"Agevalue"];
    [userDefault synchronize];
    NSLog(@"data is saved in userDefault");
    [self result];
   
    
    
    
}
-(void)result
{
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSString *fName = [defaults2 objectForKey:@"Fname"];
    NSLog(@"data in fname is %@",fName);
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    NSString *firstName = [defaults1 objectForKey:@"FirstName"];
    NSLog(@"data in firstName is %@",firstName);
    
    NSString *lastName = [defaults1 objectForKey:@"PassWord"];
    NSLog(@"data in password is %@",lastName);
    
    long age = [defaults1 integerForKey:@"Agevalue"];
    
    NSString *ageString = [NSString stringWithFormat:@"%li",age];
    NSLog(@"data in age is %@",ageString);
    long mvalue = blockName(5,5);
    NSLog(@"value in mvalue is %ld",mvalue);
    
}

//Blocks
// this is bacis block that is for send value varable value into block

int (^blockName)(int, int) = ^(int one, int two)
{
    return one*two;
};
// we can also use blocks as to pass as parameter's
// example

//-(void)block
//{

//
    
  //  NSArray *anArray = [NSArray arrayWithObjects: @"cat", @"dog",nil];
    
 //   sortFunction(anArray, ^(NSString *a, NSString *b){
  
      ///  if ( [a  isEqual: @"cat"]) return nil; else return nil;});
    
//}

// creating a dispatch Queue

-(void)testBlockMethod
{
    __block int somevalue = 10;
    int (^myOperation)(void) = ^(void)
    {
        somevalue += 5;
        return somevalue + 10;
    };
    NSLog(@"%d",myOperation());
}
/*
 //-(returnType)methodNameWithParams:(parameterType)parameterName ...<more params>... andCompletionHandler:(void(^)(<any block params>))completionHandler;

// blocks can be use insted of delegate method

-(returnType)methodNameWithParams:(parameterType)parameterName ...<more params>... andCompletionHandler:(void(^)(<any block params>))completionHandler{
    ...
    ...
    
    // When the callback should happen:
 
    completionHandler(<any required parameters>);
}
 
 The completion handler block is always defined when the method is invoked:
 
 [self methodNameWithParams:parameter1 ...<more params>... andCompletionHandler:^(<any block params>){
 // The completion handler code is added here after the method has finished execution and has made a callback.
 }];
 */


-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler{
    int result = number1 + number2;
    completionHandler(result);
}



@end
