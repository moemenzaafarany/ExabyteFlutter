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
  - new EbXhr(String method, String url, { Map<String, dynamic>? headers, Map<String, dynamic>? fields, Map<String, dynamic>? files}) : Void
      ~~~
      EbXhr xhr = new EbXhr("POST", "https://api.com/", fields: {"name": "John Smith"});
      ~~~
  - EbXhr.send() : Future\<EbXhrReponse\>
      ~~~
      EbXhrReponse response = await xhr.send();
      ~~~ 
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
