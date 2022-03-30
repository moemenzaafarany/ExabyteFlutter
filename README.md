# ExabyteFlutter

## - Packages
~~~
dependencies:

  flutter_localizations:
    sdk: flutter
    
  http: ^
  
  connectivity_plus: ^
  
  shared_preferences: ^
~~~

## - Tools

### **EbTranslate:**
  - EbTranslate.current : Locale?
  - EbTranslate.locales : List\<Locale\>
      ~~~
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: EbTranslate.current,
      supportedLocales: EbTranslate.locales,
      ~~~ 
  - EbTranslate.init() : void
      ~~~
      void main() {
        WidgetsFlutterBinding.ensureInitialized();

        // init translation
        EbTranslate.init();

        // run app
        runApp(MyApp());
      }
      ~~~ 
  - EbTranslate.set(Locale locale) : void
      ~~~
      EbTranslate.set(Locale("en));
      ~~~ 
  - EbTranslate.get(String? key, {List\<String\>? filler, Locale? locale}) : String
    - key : String? | map keys in translation json
      ~~~
      EbTranslate.get("key");
      ~~~
    - filler : List\<String\>? | if translation has \<filler\> then is replace with array according to index
      ~~~
      EbTranslate.get("key-in-translation-json", filler: ["filler"]);
      ~~~
    - locale : Locale? | if translation is needed in a language other than the current
      ~~~
      EbTranslate.get("key-in-translation-json", locale: Locale("en"));
      ~~~ 

### **EbXhr:**
  - EbXhr
    - new EbXhr(String method, String url, { Map<String, dynamic>? headers, Map<String, dynamic>? data) : Void
        ~~~
        EbXhr xhr = new EbXhr("POST", "https://api.com/", data: {"name": "John Smith", "file": FILE()});
        ~~~
    - EbXhr.send() : Future\<EbXhrReponse\>
        ~~~
        EbXhrReponse response = await xhr.send();
        ~~~ 
  - EbXhrReponse
    - EbXhrReponse.httpCode : int | Response Http Code
        ~~~
        response.httpCode = 200 | 400 | 500;
        ~~~ 
    - EbXhrReponse.error : String? | Response Error
        ~~~
        response.error = null | "string error";
        ~~~ 
    - EbXhrReponse.bodyText : String | Response Body
        ~~~
        response.bodyText = '{"data": "stuff"}';
        ~~~ 
    - EbXhrReponse.bodyJson : Map?
        ~~~
        response.bodyJson = null | {data: "stuff"};
        ~~~ 
  - ExabyteAPIResponse
    - new ExabyteAPIResponse(response) : Void | Our api response
        ~~~
        ExabyteAPIResponse exaRes = new ExabyteAPIResponse(response);
        ~~~
    - ExabyteAPIResponse.status : int? | Api Response status
        ~~~
        exaRes.status = 200 | 400 | 500;
        ~~~ 
    - ExabyteAPIResponse.statusCode : String? | Api Response status Text
        ~~~
        exaRes.statusCode = "OK" | "Bad Request" | "Internal Server Error";
        ~~~ 
    - ExabyteAPIResponse.error : String? | Api Response error
        ~~~
        exaRes.error = null | "error";
        ~~~ 
    - ExabyteAPIResponse.message : String? | Api Response message
        ~~~
        exaRes.message = null | "message";
        ~~~ 
    - ExabyteAPIResponse.data : dynamic? | Api Response data
        ~~~
        exaRes.data = null | ["data'] | {"data": "stuff"};
        ~~~ 
    - ExabyteAPIResponse.run({Function? s200, Function? s400, Function? s401, Function? s403, Function? s404, Function? s500, Function? sdefault}) : Void | Run Functions for each status
        ~~~
        exaRes.run(
          s200: ()=>print(200),
          s400: ()=>print(400),
          sdefault: ()=>print('else'),
        );
        ~~~ 

### **EbUI:**
  - EbUI.theme : ThemeMode | Current theme mode
      ~~~
      EbUI.theme = ThemeMode.system | ThemeMode.light  | ThemeMode.dark;
      ~~~
  - EbUI.fontSize : double | set fontsize for project
      ~~~
      EbUI.fontSize = 16;
      ~~~
  - EbUI.iconSize : double | set icon size for project
      ~~~
      EbUI.iconSize = 20;
      ~~~
  - EbUI.fontFamily : ThemeMode | set font family for project
      ~~~
      EbUI.fontFamily = "Roboto";
      ~~~
  - EbUI.screen(BuildContext context, double? xs, double? sm, double? md, double? lg, double? xl) : double | get double per screen size
      ~~~
      double grid = EbUI.breakpoints.screen(context, 1, 2, 3, 4, 5);
      ~~~
  - EbUI.themeData() : ThemeData | get current themedata with current colors and params
      ~~~
      EbUI.themeData();
      ~~~
  - EbUI.colors : EbUIColors  | Current ui colors
    - EbUI.colors.{any param} : Color | colors in ui

      
    
