//
//  ViewSelectCountryNLanguage.m
//  Gizmeondeals
//
//  Created by Maneesh M on 20/04/15.
//  Copyright (c) 2015 Maneesh M. All rights reserved.
//

#import "ViewSelectCountryNLanguage.h"

@implementation ViewSelectCountryNLanguage
@synthesize tableViewMain,arrayTableContents;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self.view addSubview:tableViewMain];
   // tableViewMain.backgroundColor=[UIColor whiteColor];
    if (self) {
        
        NSLog(@"%.2f %.2f %.2f %.2f",frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        
        [self customeInit];
        
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    
    
    
    
    }
    return self;
}
-(void) customeInit
{
    
    
  self.view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil]firstObject] ;
    
    
    self.bounds = self.view.bounds;
    
    [self addSubview:self.view];
    

    
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (arrayTableContents) {
        
        return arrayTableContents.count;
    }else{
        
        return 0;
    }
    
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellId =@"popUpViewCustomeCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    
    cell.textLabel.text = [[arrayTableContents objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = [arrayTableContents objectAtIndex:indexPath.row];
    
    if ([self.delegate respondsToSelector:@selector(getValueFromList:)])
    {
        [self.delegate getValueFromList:dic];
    }

    
    
    
}
-(void) reloadTable
{
    
    [tableViewMain reloadData];
    
}
-(void)setTitle :(NSString *)titleString
{
    _labelTitleForView.text = titleString;
    
}
@end
