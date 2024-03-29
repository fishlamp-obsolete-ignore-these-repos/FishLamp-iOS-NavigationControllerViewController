//
//	FLNavigationControllerViewController.m
//	FishLamp
//
//	Created by Mike Fullerton on 11/23/10.
//	Copyright (c) 2013 GreenTongue Software LLC, Mike Fullerton. 
//  The FishLamp Framework is released under the MIT License: http://fishlamp.com/license 
//

#import "FLNavigationControllerViewController.h"
#import "FLNavigationController.h"
#import "FLFloatingViewController.h"

@implementation FLNavigationControllerViewController

@synthesize rootNavigationController = _navigationController;

- (id) initWithRootViewController:(UIViewController*) viewController
{
	if((self = [super init]))
	{
		_rootViewController = FLRetain(viewController);
	    _navigationController = [[FLNavigationController alloc] initWithRootViewController:_rootViewController];
        _navigationController.wantsFullScreenLayout = YES;
        
        [self addChildViewController:_navigationController];
        
//        _navigationController.superViewController = self;
    }
	
	return self;
}

+ (FLNavigationControllerViewController*) navigationControllerViewController:(UIViewController*) rootNavigationController
{
	return FLAutorelease([[FLNavigationControllerViewController alloc] initWithRootViewController:rootNavigationController]);
}

- (void) dealloc
{
	FLRelease(_rootViewController);
	FLRelease(_navigationController);
	FLSuperDealloc();
}

- (void) loadView
{
	self.view = FLAutorelease([[UIView alloc] initWithFrame:CGRectMake(0,0,320,640)]);
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor clearColor];

//    CGSize size = _rootViewController.view.frame.size;
        
    _navigationController.navigationBar.barStyle = UIBarStyleBlack;
    _navigationController.navigationBar.translucent = YES;
    _navigationController.view.autoresizesSubviews = YES;
    _navigationController.view.autoresizingMask = UIViewAutoresizingFlexibleEverything;
    
    [self.view addSubview:_navigationController.view]; 
        
        // reset sizes back to what we want, thanks for nothing navigation Controller...
//    self.view.frame = FLRectSetSizeWithSize(self.view.frame, size);		
//    _navigationController.view.frame = FLRectSetSizeWithSize(_navigationController.view.frame, size);
//    _rootViewController.view.frame = FLRectSetSizeWithSize(_rootViewController.view.frame, size);
}

//-(void)viewDidDisappear:(BOOL)animated 
//{ 
//	[super viewDidDisappear:animated];
//	[_navigationController viewDidDisappear:animated];
//}

@end
