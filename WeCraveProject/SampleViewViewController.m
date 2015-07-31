//
//  SampleViewViewController.m
//  WeCraveProject
//
//  Created by hari on 21/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "SampleViewViewController.h"

@interface SampleViewViewController ()

@end

@implementation SampleViewViewController
@synthesize tableView1,imageOne;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    NSString *myString = [NSString stringWithFormat:@"http://192.168.1.9:8080/json/hello"];
    NSURL *url = [NSURL URLWithString:myString];
    NSData *myData = [NSData dataWithContentsOfURL:url];
    NSLog(@"%@",myData);
    NSError *error;
    NSMutableArray *json = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:myData options:kNilOptions error:&error];
    NSLog(@"%@",[json objectAtIndex:0]);
    
    NSString *imageString = [NSString stringWithFormat:@"%@",[json objectAtIndex:0]];
    
    NSURL *urlOne = [NSURL URLWithString:imageString];
    NSData *newdata = [NSData dataWithContentsOfURL:urlOne];
    [imageView setImage:[UIImage imageWithData:newdata]];
    [self.view addSubview:imageView]; */
    
    
    // Do any additional setup after loading the view.
   
   // NSURL *myURL = [NSURL URLWithString:@"http://192.168.1.9:8080/json/hello"];
    
    
    
   // NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    
//NSURLConnection *myConnection = [NSURLConnection connectionWithRequest:myRequest delegate:self];
       [self.view addSubview:imageOne];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    myData = [NSMutableData alloc];
    
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
    
    int errorCode = httpResponse.statusCode;
    
    NSString *fileMIMEType = [[httpResponse MIMEType] lowercaseString];
    
    NSLog(@"response is %d, %@", errorCode, fileMIMEType);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    NSLog(@"data is %@", data);
    
    [myData appendData:data];
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    
    
    // inform the user
    
    NSLog(@"Connection failed! Error - %@ %@",
          
          [error localizedDescription],
          
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    // do something with the data
    
    // receivedData is declared as a method instance elsewhere
    
    NSLog(@"Succeeded!");
    
    NSString *myString = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    
    NSLog(@"string is %@", myString);
    
    NSError *e = nil;
    
    NSDictionary *flickrDictionary1 = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:&e];
    
    NSLog(@"dictionary is %@", flickrDictionary1);
    NSUserDefaults *stand = [NSUserDefaults standardUserDefaults];
  
    cFRAIPArray = [[NSMutableArray alloc] initWithCapacity:6];
   
 
    for (NSArray *key in flickrDictionary) {
        
        NSLog(@"the key is %@", flickrDictionary[key]);
        
         cFRAIPArray = flickrDictionary[key]; // this will be apikey,format,method etc...
        NSLog(@"the data in array1 is %@",cFRAIPArray);
        
        NSString *imageString = [NSString stringWithFormat:@"%@",[cFRAIPArray objectAtIndex:0]];
        
        NSLog(@"array1 image string data is %@",imageString);
        NSURL  *urlOne = [NSURL URLWithString:imageString];
        NSLog(@"urlone data is %@",urlOne);
        NSData *newdata = [NSData dataWithContentsOfURL:urlOne];
        NSLog(@"data in newData is %@",newdata);
        //[UIImageView setImage:[UIImage imageWithData:newdata]];
        /*
        if ([object isKindOfClass:[NSDictionary class]]) { //first 4 are arrays-crsh-dicts
            
            NSLog(@"object valueForKey is %@", [object valueForKey:@"interests"]);
            
            [cFRAIPArray addObject:[object valueForKey:@"interests"]];
            
            NSLog(@"the data in cfraiparray id %@",cFRAIPArray);
            
        }
        else {
            
            [cFRAIPArray addObject:flickrDictionary[key]];
            
        }
        */
    }
    
    //NSLog(@"cfraiparray %@", cFRAIPArray);
    
   // [self.tableView reloadData];

   
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [array1 count];
}
- (CGFloat)heightForRowAtIndex:(NSUInteger)index
{
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
   //array1;
    cell.textLabel.text = @"My Text";
    return cell;


    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 [cell.imageView setImageWithURL:[NSURL URLWithString:@"http://www.domain.com/path/to/image.jpg"]
 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
*/


@end
