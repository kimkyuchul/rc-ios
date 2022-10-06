# Project

### 1.  SoundCloud AutoLayout Clone 
[링크](https://github.com/kimkyuchul/rc-ios/tree/main/SoundCloud)

**`SoundCloud` iOS AutoLayout**

#### ▶︎ 실행화면
<img src="https://github.com/kimkyuchul/rc-ios/blob/main/GIF/SoundCloud.gif" width="51%"/>

#### ▶︎ 회고

- Stack View의 Alignment와 Distribution 설정이 많은 연습이 필요한 거 같다.
- Scroll View 구현 참고(http://yoonbumtae.com/?p=3852)
- tab bar 구현 참고(https://vanillacreamdonut.tistory.com/238)
- navigation bar 스크롤 시 Large title 변경되는 것을 구현 참고 (https://ios-development.tistory.com/516)
- statusbar 색상 변경(https://www.ioscreator.com/tutorials/change-color-status-bar-ios-tutorial)
- iOS15 이상에서 Navigation or Tab bar 배경색이 투명색으로 노출되는 등의 문제 (https://developer.apple.com/forums/thread/682420)
                                      
가로 스크롤 뷰와 동적으로 늘어나는 스크롤뷰 구현 연습이 필요하다.
가장 중요한 점은 코드로 ui 짜는 연습이 시급한 것 같다..

<br></br>
-------------------------------------------------------
### 3. 'How much do you know about Kyu-Chul Kim?' Quiz Game
[링크](https://github.com/kimkyuchul/rc-ios/tree/main/KyuchulQuiz)

**`How much do you know about Kyu-Chul Kim?` iOS CollectionView & URLSession & UserDefault**

#### ▶︎ 게임로직
<img src="https://github.com/kimkyuchul/rc-ios/blob/main/GIF/KyuchulQuiz.gif" width="45%"/>

#### ▶︎ 랭크시스템
<img src="https://github.com/kimkyuchul/rc-ios/blob/main/GIF/KyuchulQuiz-RankSystem.gif" width="45%"/>

#### ▶︎ 회고

- gist.github를 통해 json 파일을 만들어 URLSession으로 퀴즈 데이터 통신
- CollectionView를 통해 퀴즈 정답 선택 뷰 구현 -> xib없이 구현해서 많이 복잡해짐 다음에는 cell를 따로 만들어서 ReusableCell 하여 만들자
- UserDefault를 활용해 점수와 이름을 딕셔너리 형태로 저장하여 랭크 시스템을 구현 (https://cocoacasts.com/ud-12-benefits-of-creating-an-extension-for-user-defaults)
- UserDefault가 잘 저장되는지 확인하면서 구현해봄(https://yerang.kim/swift/[swift]-userdefaults는-어디에-저장될까/)

<br></br>
-------------------------------------------------------
### 4. Social Login (KaKao & Naver)
[링크](https://github.com/kimkyuchul/rc-ios/tree/main/Social\Login/)

**`Social Login` iOS KaKao Login & Naver Login**

#### ▶︎ 실행화면
<img src="https://github.com/kimkyuchul/rc-ios/blob/main/GIF/SocialLogin.gif" width="51%"/>

#### ▶︎ 회고

- KaKaoLogin (https://developers.kakao.com/docs/latest/ko/kakaologin/ios/)
- NaverLogin (https://developers.naver.com/docs/login/ios/ios.md)
- 네이버 로그인 샘플 앱 (https://github.com/naver/naveridlogin-sdk-ios)
- SnapKit & Then도 맛봐봄
- 참고한 네아로 구현 블로그 (https://bmwe3.tistory.com/1767, https://www.zehye.kr/ios/2021/09/30/iOS_social_login/)
- 참고한 카카오 로그인 구현 블로그 (https://sujinnaljin.medium.com/ios-%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1-%EC%86%8C%EC%85%9C-%EB%A1%9C%EA%B7%B8%EC%9D%B8-58a525e6f219)
