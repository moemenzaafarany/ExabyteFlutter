<hr>

# ExabyteFlutter

<ul>
  <li>
    <a href="#--packages">Packages</a>
  </li>
  <li>
    <a href="#--tools">Tools</a>
    <ul>
      <li>
        <a href="#ebtranslate">EbTranslate</a>
      </li>
      <li>
        <a href="#ebxhr">EbXhr</a>
      </li>
      <li>
        <a href="#ebui">EbUI</a>
      </li>
    </ul>
  </li>
</ul>

<hr>

## - Packages
  ```sh
  dependencies:

    flutter_localizations:
      sdk: flutter

    http: ^

    connectivity_plus: ^

    shared_preferences: ^
  ```
  
<p align="right">(<a href="#exabyteflutter">back to top</a>)</p>
<hr>

## - Tools

### **EbTranslate:**
  - EbTranslate.current : Locale?
  - EbTranslate.locales : List\<Locale\>
    ```sh
    localizationsDelegates: const [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    locale: EbTranslate.current,
    supportedLocales: EbTranslate.locales,
    ``` 
  - EbTranslate.init() : void
    ```sh
    void main() {
      WidgetsFlutterBinding.ensureInitialized();

      // init translation
      EbTranslate.init();

      // run app
      runApp(MyApp());
    }
    ``` 
  - EbTranslate.set(Locale locale) : void
    ```sh
    EbTranslate.set(Locale("en));
    ``` 
  - EbTranslate.get(String? key, {List\<String\>? filler, Locale? locale}) : String
    - key : String? | map keys in translation json
      ```sh
      EbTranslate.get("key");
      ```
    - filler : List\<String\>? | if translation has \<filler\> then is replace with array according to index
      ```sh
      EbTranslate.get("key-in-translation-json", filler: ["filler"]);
      ```
    - locale : Locale? | if translation is needed in a language other than the current
      ```sh
      EbTranslate.get("key-in-translation-json", locale: Locale("en"));
      ``` 

<p align="right">(<a href="#exabyteflutter">back to top</a>)</p>
<hr>

### **EbXhr:**
  - EbXhr
    - new EbXhr(String method, String url, { Map<String, dynamic>? headers, Map<String, dynamic>? data) : Void
        ```sh
        EbXhr xhr = new EbXhr("POST", "https://api.com/", data: {"name": "John Smith", "file": FILE()});
        ```
    - EbXhr.send() : Future\<EbXhrReponse\>
        ```sh
        EbXhrReponse response = await xhr.send();
        ``` 
  - EbXhrReponse
    - EbXhrReponse.httpCode : int | Response Http Code
        ```sh
        response.httpCode = 200 | 400 | 500;
        ``` 
    - EbXhrReponse.error : String? | Response Error
        ```sh
        response.error = null | "string error";
        ``` 
    - EbXhrReponse.bodyText : String | Response Body
        ```sh
        response.bodyText = '{"data": "stuff"}';
        ``` 
    - EbXhrReponse.bodyJson : Map?
        ```sh
        response.bodyJson = null | {data: "stuff"};
        ``` 
  - ExabyteAPIResponse
    - new ExabyteAPIResponse(response) : Void | Our api response
        ```sh
        ExabyteAPIResponse exaRes = new ExabyteAPIResponse(response);
        ```
    - ExabyteAPIResponse.status : int? | Api Response status
        ```sh
        exaRes.status = 200 | 400 | 500;
        ``` 
    - ExabyteAPIResponse.statusCode : String? | Api Response status Text
        ```sh
        exaRes.statusCode = "OK" | "Bad Request" | "Internal Server Error";
        ``` 
    - ExabyteAPIResponse.error : String? | Api Response error
        ```sh
        exaRes.error = null | "error";
        ``` 
    - ExabyteAPIResponse.message : String? | Api Response message
        ```sh
        exaRes.message = null | "message";
        ``` 
    - ExabyteAPIResponse.data : dynamic? | Api Response data
        ```sh
        exaRes.data = null | ["data'] | {"data": "stuff"};
        ``` 
    - ExabyteAPIResponse.run({Function? s200, Function? s400, Function? s401, Function? s403, Function? s404, Function? s500, Function? sdefault}) : Void | Run Functions for each status
        ```sh
        exaRes.run(
          s200: ()=>print(200),
          s400: ()=>print(400),
          sdefault: ()=>print('else'),
        );
        ``` 

<p align="right">(<a href="#exabyteflutter">back to top</a>)</p>
<hr>

### **EbUI:**
  - EbUI.theme : ThemeMode | Current theme mode
      ```sh
      EbUI.theme = ThemeMode.system | ThemeMode.light  | ThemeMode.dark;
      ```
  - EbUI.fontSize : double | set fontsize for project
      ```sh
      EbUI.fontSize = 16;
      ```
  - EbUI.iconSize : double | set icon size for project
      ```sh
      EbUI.iconSize = 20;
      ```
  - EbUI.fontFamily : ThemeMode | set font family for project
      ```sh
      EbUI.fontFamily = "Roboto";
      ```
  - EbUI.screen(BuildContext context, double? xs, double? sm, double? md, double? lg, double? xl) : double | get double per screen size
      ```sh
      double grid = EbUI.screen(context, 1, 2, 3, 4, 5);
      ```
  - EbUI.themeData() : ThemeData | get current themedata with current colors and params
      ```sh
      EbUI.themeData();
      ```
  - EbUI.colors : EbUIColors  | Current ui colors
    - EbUI.colors.{any param} : Color | colors in ui

<p align="right">(<a href="#exabyteflutter">back to top</a>)</p>
<hr>
