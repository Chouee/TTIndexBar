//
//  TTIndexBar.m
//
//  Created by Chouee on 2017/11/30.
//

#import "TTIndexBar.h"


@interface CustomView: UIView

@property (nonatomic, strong) UILabel *indexLabel;
@property (nonatomic, strong) UIColor *drawColor;
@property (nonatomic, strong) UIColor *textColor;

@end


@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _drawColor = [UIColor lightGrayColor];
        _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.height)];
        _indexLabel.textColor = [UIColor whiteColor];
        _indexLabel.textAlignment = NSTextAlignmentCenter;
        _indexLabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:_indexLabel];
        
    }
    return self;
}

- (void)setTextColor:(UIColor *)textColor {
    
    _textColor = textColor;
    _indexLabel.textColor = textColor;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context,_drawColor.CGColor);
    [self getDrawPath:context];
    CGContextFillPath(context);
}

- (void)getDrawPath:(CGContextRef)context {
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat xOffset = self.bounds.size.width * 1/4;
    CGFloat yOffset = self.bounds.size.height * 1/4;
    CGFloat radius = sqrt(pow(xOffset, 2) + pow(yOffset, 2));
    
    //Draw triangle
    CGContextMoveToPoint(context, width - xOffset, height * 0.5 - yOffset);
    CGContextAddLineToPoint(context,width, height * 0.5);
    CGContextAddLineToPoint(context,width - xOffset, height * 0.5 + yOffset);
    
    //Draw semicircle
    CGContextAddArcToPoint(context, width * 0.5, height, width * 0.5 - xOffset, height * 0.5 + yOffset, radius);
    CGContextAddArcToPoint(context, 0, height * 0.5, width * 0.5 - xOffset, height * 0.5 - yOffset, radius);
    CGContextAddArcToPoint(context, width * 0.5, 0, width * 0.5 + xOffset, height * 0.5 - yOffset, radius);
    CGContextClosePath(context);
}

@end


@interface TTIndexBar()

@property (nonatomic, strong) UILabel *preLabel;
@property (nonatomic, assign) NSInteger preIndex;
@property (nonatomic, strong) NSMutableArray *labelArr;
@property (nonatomic, strong) CustomView *indexDetailView;
@property (nonatomic, strong) UIImpactFeedbackGenerator *gen API_AVAILABLE(ios(10.0));

@end


@implementation TTIndexBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self initData];
    }
    return self;
}

- (UIImpactFeedbackGenerator *)gen {
    if (_gen == nil) {
        _gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [_gen prepare];
    }
    return _gen;
}


/**
 Data initialization
 */
- (void)initData {
    _preIndex = -1;
    _sectionHeight = 16;
    _textColor = [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1];
    _selectedTextColor = [UIColor whiteColor];
    _selectedBackgroundColor = [UIColor colorWithRed:54/255.0 green:129/255.0 blue:228/255.0 alpha:1];
    _detailViewDrawColor = [UIColor lightGrayColor];
    _detailViewTextColor = [UIColor whiteColor];
}


/**
 Set the data source
 */
- (void)setIndexes:(NSArray *)indexes {
    
    //Reset data
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
    
    [_labelArr removeAllObjects];
    _preIndex = -1;
    
    _indexDetailView = [[CustomView alloc] initWithFrame:CGRectMake(-80, 0, 50, 50)];
    _indexDetailView.backgroundColor = [UIColor clearColor];
    _indexDetailView.drawColor = _detailViewDrawColor;
    _indexDetailView.textColor = _detailViewTextColor;
    _indexDetailView.alpha = 0;
    [self addSubview:_indexDetailView];
    
    //Recalculate the height
    CGRect rect = self.frame;
    rect.size.height = indexes.count * _sectionHeight;;
    rect.origin.y = (self.superview.bounds.size.height - rect.size.height) * 0.5;
    [self setFrame:rect];
    
    //Add labels
    CGFloat width = _sectionHeight;
    CGFloat height = _sectionHeight;
    CGFloat x = (self.bounds.size.width - width) *  0.5;
    
    _labelArr = [NSMutableArray new];
    for (int i = 0; i < indexes.count; i++) {
        CGFloat y = (_sectionHeight * i);
        
        UILabel *alphaLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        alphaLabel.textAlignment = NSTextAlignmentCenter;
        alphaLabel.text = [[indexes objectAtIndex:i] uppercaseString];
        alphaLabel.font = [UIFont boldSystemFontOfSize:10.0];
        alphaLabel.backgroundColor = [UIColor clearColor];
        alphaLabel.textColor = self.textColor;
        alphaLabel.layer.cornerRadius = width * 0.5;
        alphaLabel.clipsToBounds = YES;
        [self addSubview:alphaLabel];
        [_labelArr addObject:alphaLabel];
    }
    
    //0 is selected by default
    if (indexes.count > 0) {
        [self setSelectedLabel:0];
    }
}

- (void)setSelectedLabel:(NSInteger)index {
    
    _preLabel.backgroundColor = [UIColor clearColor];
    _preLabel.textColor = _textColor;
    UILabel *label = _labelArr[index];
    label.textColor = _selectedTextColor;
    label.backgroundColor = _selectedBackgroundColor;
    _preLabel = label;
}

- (void)toSelectTitle:(CGPoint)touchPoint {
    
    if(touchPoint.y <= 0 || touchPoint.y >= self.bounds.size.height) return;
    
    __block NSString *title;
    __block NSInteger index = 0;
    
    [_labelArr enumerateObjectsUsingBlock:^(__kindof UILabel * _Nonnull subview, NSUInteger idx, BOOL * _Nonnull stop) {
        if(touchPoint.y < CGRectGetMaxY(subview.frame)) {
            _preLabel.backgroundColor = [UIColor clearColor];
            _preLabel.textColor = _textColor;
            subview.backgroundColor = _selectedBackgroundColor;
            subview.textColor = _selectedTextColor;
            _preLabel = subview;
            index = idx;
            title = subview.text;
            *stop = YES;
        }
    }];
    
    if (_preIndex == index) return;
    
    _preIndex = index;
    _indexDetailView.center = CGPointMake(_indexDetailView.center.x, _sectionHeight * 0.5 + index * _sectionHeight);
    _indexDetailView.indexLabel.text = title;
    
    //impact
    if (@available(iOS 10.0, *)) {
        [self.gen impactOccurred];
    }
    
    if (_delegate && [_delegate conformsToProtocol:@protocol(TTIndexBarDelegate)]) {
        [_delegate indexDidChanged:self index:index title:title];
    }
}

#pragma mark - Touch Methods

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    _onTouch = NO;
    [UIView animateWithDuration:.3 animations:^{
        self.indexDetailView.alpha = 0;
    }];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    
    _onTouch = YES;
    if (!_hideDetailView) {
        _indexDetailView.alpha = 1;
    }
    CGPoint touchPoint = [[[event touchesForView:self] anyObject] locationInView:self];
    [self toSelectTitle:touchPoint];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesMoved:touches withEvent:event];
    
    CGPoint touchPoint = [[[event touchesForView:self] anyObject] locationInView:self];
    [self toSelectTitle:touchPoint];
}


@end




