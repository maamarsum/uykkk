//
//  TopBarView.m
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 27/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import "TopBarView.h"

#import "InterfaceManager.h"
#import "SlideNavigationController.h"
#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "BinSystemsServerConnectionHandler.h"
#import "ModelProduct.h"
#import "DefineServerLinks.h"
#import "ProductViewController.h"
#import "KLCPopup.h"
#import "DealstableviewcellTableViewCell.h"
@implementation TopBarView

{
    NSString *searchstring;
    
    KLCPopup * popupCountry;
    
    NSMutableArray * arraysearchdetails,*jsonarray;
    UITableView * tableViewSearchResults;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGRect myFrame = self.bounds;
    CGContextSetLineWidth(context, 10);
    CGRectInset(myFrame, 5, 5);
    [[UIColor grayColor] set];
    
    UIRectFrame(myFrame);
    
    
}




-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    

    UINib* nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
    [nib instantiateWithOwner:self options:nil];
    
     self.view.frame = self.frame;
    
    [self addSubview:self.view];
    
    
    return self;
}
// //static TopBarView *instance=nil;
//- (id) awakeAfterUsingCoder:(NSCoder*)aDecoder {
//    
//    tableViewSearchResults.delegate=self;
//    tableViewSearchResults.dataSource=self;
//    _searchBarMain.delegate=self;
//    
//    
//    BOOL theThingThatGotLoadedWasJustAPlaceholder = ([[self subviews] count] == 0);
//    
//    if (theThingThatGotLoadedWasJustAPlaceholder) {
//        
//        TopBarView* theRealThing = [[self class] loadFromNib];
//        
//        // pass properties through
//        theRealThing.frame = self.frame;
//        theRealThing.autoresizingMask = self.autoresizingMask;
//        theRealThing.alpha = self.alpha;
//        theRealThing.hidden = self.hidden;
//        
//        
//        // convince ARC that we're legit
//        CFRelease((__bridge const void*)self);
//        CFRetain((__bridge const void*)theRealThing);
//        
//
//        
//        
//        return theRealThing;
//    }
//   // self.backgroundColor=[UIColor redColor];
//    return self;
//
//}
  - (IBAction)buttonActionMenu:(id)sender {
    
//    UIViewController * owner = [self getSuperViewController];
      
      
      static Menu menu = MenuLeft;
      
 
      [[SlideNavigationController sharedInstance] openMenu:menu withCompletion:nil];
      
      
}
 - (UIViewController*)getSuperViewController
    {
        for (UIView* next = [self superview]; next; next = next.superview)
        {
            UIResponder* nextResponder = [next nextResponder];
            
            if ([nextResponder isKindOfClass:[UIViewController class]])
            {
                return (UIViewController*)nextResponder;
            }
        }
        
        return nil;
    }

+ (id) loadFromNib {
    NSString* nibName = NSStringFromClass([self class]);
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    for (NSObject* anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            return anObject;
        }
    }
    return nil;
}

// ************************************search ********************************//



-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
 
    
    
    
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    searchstring=searchBar.text;
   
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    tableViewSearchResults=[[UITableView alloc]initWithFrame:CGRectMake(searchBar.frame.origin.x, searchBar.frame.origin.y+searchBar.frame.size.height, searchBar.frame.size.width, 375)];
    
    tableViewSearchResults.rowHeight=45;
    
    tableViewSearchResults.delegate=(id)self;
    tableViewSearchResults.dataSource=(id)self;
    
    tableViewSearchResults.scrollEnabled=YES;
    
    
    UIViewController *VC = [self getSuperViewController];
    
    
    
    [VC.view addSubview:tableViewSearchResults];
    
    
    [self loadsearchdetails];
    
}

-(void)loadsearchdetails{
    
    
    
    arraysearchdetails = [[NSMutableArray alloc]init];
    
    
    NSString *PostData= [NSString stringWithFormat:@"search=%@&lan=%@",searchstring,@"1"];
    NSLog(@"Request: %@", PostData);
    
    
   BinSystemsServerConnectionHandler * AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_searchProduct PostData:PostData];
    
    
    [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
        
        
        
        
        
        
        NSMutableArray * Result1 = [JSONDict valueForKey:@"data"];
        
        
        
        if (Result1) {
            
            
            
            
            NSString * ErroCode;
            
            if ([ErroCode isEqualToString:@"403"] ) {
                
                
            }else
            {
                
                
                jsonarray = [JSONDict valueForKey:@"data"];
                
                for (NSDictionary * productDetails in jsonarray) {
                    
                    ModelProduct * product = [ModelProduct new];
                    
                    
                    product.productName=[productDetails valueForKey:@"name"];
                    NSLog(@"%@",[productDetails valueForKey:@"name"]);
                    NSLog(@"%@",product.productName);
                    
                    product.productPrice=[productDetails valueForKey:@"price"];
                    product.productModel=[productDetails valueForKey:@"model"];
                    // product.productImage=[productDetails valueForKey:@"image"];
                    
                    product.productImageUrl=[productDetails valueForKey:@"image"];
                    
                    [arraysearchdetails addObject:product];
                    
                    
                }
                NSLog(@"%@",arraysearchdetails);
                
                
                [tableViewSearchResults reloadData];
                
                
                
                
                
                
                
                
            }
            
            
        }
        
        
        
        
    } FailBlock:^(NSString *Error) {
        
        [InterfaceManager DisplayAlertWithMessage:@"Your net connection is too slow"];
        
        
    }];
    
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    if (tableViewSearchResults) {
         return arraysearchdetails.count;
    }
    return 0;
    
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==tableViewSearchResults) {
        
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
      
        
        DealstableviewcellTableViewCell * cellForDealsList= (DealstableviewcellTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"dealsList"];
        
        //if (cellFordealsList==NULL||cellForLastCell==NULL) {
        NSArray *tableCellArray =[[NSBundle mainBundle]loadNibNamed:@"DealstableviewcellTableViewCell" owner:self options:nil];
        
        
        if ([indexPath row]<arraysearchdetails.count) {
            
            cellForDealsList=[tableCellArray objectAtIndex:0];
            
            
            ModelProduct * productdetails = [ModelProduct new];
            productdetails=[arraysearchdetails objectAtIndex:indexPath.row];
            
            // UIImageView *imageViewProductImage = (UIImageView *)[cellForDealsList viewWithTag:201];
            /*
             UILabel * labeldealsName = (UILabel *)[cellFordealsList viewWithTag:202];
             UILabel * labeldealsPrice = (UILabel *)[cellFordealsList viewWithTag:203];
             UILabel * labeldealsmodel = (UILabel *)[cellFordealsList viewWithTag:204];
             */
            
            cellForDealsList.name.text =  productdetails.productName;
            //cellForDealsList.price.text=@"10";
            cellForDealsList.price.text = [NSString stringWithFormat:@"%.2f",[productdetails.productPrice floatValue]];
            cellForDealsList.model.text = productdetails.productModel;
            
            
            if (productdetails.productImage==nil) {
                
                cellForDealsList.image.image = [UIImage imageNamed:@"Men_at_work.png"];
                //Pending
                
                // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                
                ModelProduct * tempProduct = [arraysearchdetails objectAtIndex:indexPath.row];
                
                NSURL * imgUrl =[NSURL URLWithString:[@"http://talenweave.com/qatardeals2/image/" stringByAppendingString:productdetails.productImageUrl]];
                
                NSData *downloadedData = [NSData dataWithContentsOfURL:imgUrl];
                
                tempProduct.productImage = [UIImage imageWithData:downloadedData];
                
                
                
                [arraysearchdetails replaceObjectAtIndex:indexPath.row withObject:tempProduct];
                
                
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    
                    //    NSData *imgData=[dictionaryImageDataModel valueForKey:@"imageData"];
                    ModelProduct * tempProduct = [arraysearchdetails objectAtIndex:indexPath.row];
                    
                    if (tempProduct.productImage != nil) {
                        
                        
                        cellForDealsList.image.image = tempProduct.productImage;
                        
                    }
                    
                    NSLog(@"Image Loaded %ld",(long)indexPath.row);
                    
                });
                
                
                
                
                
                
                
                
            }else{
                
                
                cellForDealsList.image.image = productdetails.productImage;
                
                cellForDealsList.imageView.contentMode=UIViewContentModeScaleAspectFill;
                
                
                
            }
            
            
        }
    
    
       return cellForDealsList;
    }
    return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row<arraysearchdetails.count) {
        return 120;
    }else
        return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * superViewC = [self getSuperViewController];
    
    ProductViewController *viewproductVCobj = [superViewC.storyboard instantiateViewControllerWithIdentifier:@"productview"];
    
    
    
    viewproductVCobj.thisProduct = [arraysearchdetails objectAtIndex:indexPath.row];
    
    // [self.navigationController presentViewController:viewproductVCobj animated:YES completion:nil];
    
    [superViewC.navigationController pushViewController:viewproductVCobj animated:YES];
    
    
    
}

@end
