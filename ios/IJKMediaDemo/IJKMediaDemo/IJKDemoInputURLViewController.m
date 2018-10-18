/*
 * Copyright (C) 2015 Gdier
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "IJKDemoInputURLViewController.h"
#import "IJKMoviePlayerViewController.h"

@interface IJKDemoInputURLViewController () <UITextViewDelegate>

@property(nonatomic,strong) IBOutlet UITextView *textView;

@end

@implementation IJKDemoInputURLViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Input URL";
        
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Play" style:UIBarButtonItemStyleDone target:self action:@selector(onClickPlayButton)]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)onClickPlayButton {
//    NSURL *url = [NSURL URLWithString:@"http://api.dongci-test.wmlives.com/opus/play?id=1603644356&sign=58060fcaf57468f64afb4f0e6b4ed31c"];
    NSURL *url = [NSURL URLWithString:@"http://aliuwmp3.changba.com/userdata/video/45F6BD5E445E4C029C33DC5901307461.mp4"];
    NSString *scheme = [[url scheme] lowercaseString];
    
    if ([scheme isEqualToString:@"http"]
        || [scheme isEqualToString:@"https"]
        || [scheme isEqualToString:@"rtmp"]) {
        [IJKVideoViewController presentFromViewController:self withTitle:[NSString stringWithFormat:@"URL: %@", url] URL:url completion:^{
//            [self.navigationController popViewControllerAnimated:NO];
        }];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self onClickPlayButton];
}

@end
