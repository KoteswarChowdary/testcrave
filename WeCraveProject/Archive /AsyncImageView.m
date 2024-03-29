//
//  AsyncImageView.m
//  YellowJacket
//
//  Created by Wayne Cochran on 7/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AsyncImageView.h"
#import "ImageCacheObject.h"
#import "ImageCache.h"

//
// Key's are URL strings.
// Value's are ImageCacheObject's
//
static ImageCache *imageCache = nil;

@implementation AsyncImageView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [connection cancel];
    }

-(void)loadImageFromURL:(NSURL*)url {
    isActualSize = NO;
    if (connection != nil) {
        [connection cancel];
       
        connection = nil;
    }
    if (data != nil) {
       
        data = nil;
    }
    
    if (imageCache == nil) // lazily create image cache
        imageCache = [[ImageCache alloc] initWithMaxSize:30*1024*1024];  // 2 MB Image cache
    
       urlString = [[url absoluteString] copy];
    UIImage *cachedImage = [imageCache imageForKey:urlString];
    if (cachedImage != nil) {
        if ([[self subviews] count] > 0) {
            [[[self subviews] objectAtIndex:0] removeFromSuperview];
        }
        UIImageView *imageView = [[UIImageView alloc] initWithImage:cachedImage];
        imageView.backgroundColor = [UIColor clearColor];
        // imageView.contentMode = UIViewContentModeScaleAspectFit;
       // imageView.autoresizingMask = 
          //  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:imageView];
        imageView.frame = self.bounds;
        [imageView setNeedsLayout]; // is this necessary if superview gets setNeedsLayout?
        [self setNeedsLayout];
        return;
    }
    
#define SPINNY_TAG 5555   
    
    UIActivityIndicatorView *spinny = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinny.tag = SPINNY_TAG;
    spinny.center = self.center;
    [spinny startAnimating];
    [self addSubview:spinny];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url 
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy 
                                         timeoutInterval:60.0];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}


-(void)loadImagewithActualSizeFromURL:(NSURL *)url
{
    isActualSize = YES;
    if (connection != nil) {
        [connection cancel];
       
        connection = nil;
    }
    if (data != nil) {
        
        data = nil;
    }
    
    if (imageCache == nil) // lazily create image cache
        imageCache = [[ImageCache alloc] initWithMaxSize:30*1024*1024];  // 2 MB Image cache
    
    
    urlString = [[url absoluteString] copy];
    UIImage *cachedImage = [imageCache imageForKey:urlString];
    if (cachedImage != nil) {
        if ([[self subviews] count] > 0) {
            [[[self subviews] objectAtIndex:0] removeFromSuperview];
        }
        UIImageView *imageView = [[UIImageView alloc] initWithImage:cachedImage];
        imageView.backgroundColor = [UIColor clearColor];
        // imageView.contentMode = UIViewContentModeScaleAspectFit;
        // imageView.autoresizingMask = 
        //  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:imageView];
        imageView.frame = self.bounds;
        CGSize imageSize = [imageView.image size];
        self.backgroundColor = [UIColor clearColor];
        NSLog(@"imageSize :%f------%f",imageSize.width,imageSize.height);
        if (imageSize.width < self.bounds.size.width) {
            float orignX = (self.bounds.size.width - imageSize.width)/2;
            imageView.frame = CGRectMake(orignX, imageView.frame.origin.y, imageSize.width, imageView.frame.size.height);
        }
        if (imageSize.height < self.bounds.size.height) {
            float origny = (self.bounds.size.height - imageSize.height)/2;
            imageView.frame = CGRectMake(imageView.frame.origin.x, origny, imageView.frame.size.width, imageSize.height);
        }
        
        
        [imageView setNeedsLayout]; // is this necessary if superview gets setNeedsLayout?
        [self setNeedsLayout];
        return;
    }
    
#define SPINNY_TAG 5555   
    
    UIActivityIndicatorView *spinny = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinny.tag = SPINNY_TAG;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    UIImage *image = [UIImage imageNamed:@"home2.png"];
    [imageView setImage:image];
   

    spinny.center = self.center;
    [spinny startAnimating];
    [self addSubview:imageView];
    [self addSubview:spinny];
   
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy 
                                         timeoutInterval:60.0];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}



- (void)connection:(NSURLConnection *)connection 
    didReceiveData:(NSData *)incrementalData {
    if (data==nil) {
        data = [[NSMutableData alloc] initWithCapacity:2048];
    }
    [data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConnection {
   
    connection = nil;
    
    UIView *spinny = [self viewWithTag:SPINNY_TAG];
    
    [spinny removeFromSuperview];
    
    if ([[self subviews] count] > 0) {
        [[[self subviews] objectAtIndex:0] removeFromSuperview];
    }
    
    UIImage *image = [UIImage imageWithData:data];
    
    [imageCache insertImage:image withSize:[data length] forKey:urlString];
    
    UIImageView *imageView1 = [[UIImageView alloc]
                               initWithImage:image];
    imageView1.backgroundColor = [UIColor whiteColor];
   // imageView.contentMode = UIViewContentModeScaleAspectFit;
   // imageView.autoresizingMask = 
      //  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:imageView1];
    
    imageView1.frame = self.bounds;
    
    if (isActualSize) {
        self.backgroundColor = [UIColor clearColor];
        CGSize imageSize = [imageView1.image size];
        NSLog(@"imageSize :%f------%f",imageSize.width,imageSize.height);
        if (imageSize.width < self.bounds.size.width) {
            float orignX = (self.bounds.size.width - imageSize.width)/2;
            imageView1.frame = CGRectMake(orignX, imageView1.frame.origin.y, imageSize.width, imageView1.frame.size.height);
        }
        if (imageSize.height < self.bounds.size.height) {
            float origny = (self.bounds.size.height - imageSize.height)/2;
            imageView1.frame = CGRectMake(imageView1.frame.origin.x, origny, imageView1.frame.size.width, imageSize.height);
        }
    }
    [imageView1 setNeedsLayout]; // is this necessary if superview gets setNeedsLayout?
    [self setNeedsLayout];
    data = nil;
}

@end
