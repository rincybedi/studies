.net core 3.1
cross platifrm, open source, high performance
need .net core sdk and run time
sdk already includes runtime to build and run apps that
  
we can directly edit a sln file in core without iunloading project as compared to .net framework
file/ project refs are not included in project file, file system determines what files and folders belong to project
file system determines what files and folders should be included

startup cs  has configure method which takes IApplicationBuilder service as DI, each
configure method setups the request and response processing  pirpleine

Configure(IApplicationBuilder app, IHosstingEnvironment env, ILogger<Startup> logger){
    app.UseDeveloperExceptionPage(); //Middlewaes
    //Run is an extendsion method on interface to (public static void Run(this IApplicationBuilder app, RequestDelegate handler))
`
    app.Run(async (context, next) =>
    {  //Delegate as middleware , this context has access to both request and response pipeline
        await context.Request.write(",,,,")
        next(); //delegate
    })
}

any static file wont be served now 
execution starts with Main () of Prgaram, it callsCreateDefaultBuilder() pf WebHost class
this method:
sets kestral as web server
configre application confirgraton from various sources like appsettings json and env files
configre logging 

logger.LogInformation - logs in Output panel
middleware to next and next and then pipleine reverseMessage  

static files
-app.UseDefaultFiles - for default.html(above)
-- all files must be in the wwwroot directory-- content root foder
- app.useStaticFiles - mw


or app.UseFileServer


Conventions:
use keyword
for customizing mw, we add a param with options suffix
eg UseDeveloperExceptionPageOptions object


UseDeveloperExceptionPage mw:
suppose we have 3 mw in order :
useDeveloperExceptionPage
useFileServer
app.Run(..throws Exception), if we make a request localhost/abc.htm , where abc file isnt present, it will throw exception
How?
request for abc htm comes to 1st mw, it doesnt do anythng and passes to 2nd useFileServer, it doesnt find that file and passes to 3rd, which throws exception, now the 1st mw sees that subsequent mws is throwing exc, so it comes into action
so, useDeveloperExceptionPage sd always be placed as early as possible

Environment: security(dont show exception) and performaces(high) at prod

Env var:
use env var : ASPNETCORE_ENVIRONMENT: in launchSettings json profiles
u can set in OS too
Default val is Prodction for better performance and security

setup mvc in core:
-add mvc srevices to DI container in ConfigureServices() os Startup

public void ConfigureServices(IServiceCollection services)
{
services.AddMvc();
}

-add mvc mw to request processing pipeline
app.UseStaticFiles()
app.useMvcWithDefaultRoute() with def route Home/Index after UseStaticFiles mw
-above order is important, so any req to static files dont fo to mvc for unecessary processing

- u need to add mvc service to DI container in addition to add mvc mw, else exception


AddMvc vs AddMvcCore
addmvccore method only add core mvc services
addmvc adds all mvc services

eg if u use addmvccore and  wanna return json from controller, u inherit class from Controller class and if u miss a semicolon, page will show, no srevice for JsonresultFormatter has been registered

addmvc internally calls addm vccore

DI:
constrcutor injection in controller/provider layer
register interface and its implementor in startup - configure services

services.AddSingleton<IEm, Em>() - created when its first requested and then same service can be used by all subsequent requests - 1 per application
AddTransient - new instance of service is created for each request
AddScoped - new instance of service is created once per request within the scope

why need DI, why cant just instatntiate?
tight coupling
eg : if u instantiat dependencies like MockupEmployeeRepository and later decided to change implemetor to SQLEmployeeRepository, and if this repo class is usedin several places, tedious and error prone

razor : @ symbol
ViewData and ViewBag
with ViewBag, we need to explicitly cast to datatype except string
Viewbad is a wrapper around viewData, it uses dynamic properties instead of string keyS

stringly tyoed view @Model
ViewModel - contains all data u need 

Layout View - in Shared - _Layout.cshtml
t avoid repeating sections like header footer side panel for site
@RendreBody - replaces specific content
set @Layout prop in each individual view or ViewStart

@RenderSection("Scripts" ,required: false) - to render speicif sections  from views
_ViewImports - to avoid duplicating namespace
@using ss..dd ..


ROuting:
u can use UseMvcWithDefaultRoute or
 UseMvc(routes=>[
routes.MapRoute("default","{controller="Home"}/{actionname}/{id?}")
])

Attribute routing:
[Route("Home/Index")] on action
or apply at controller with Home prefix 
attribute routing allows using token like [Route("[controller]")]

tag helpers: <a asp-controller="Home"asp-action="Index" />
this is better than html helpers because if route changes we dont have to change say anchor link manually.
Image tag helper append unique version to help issues with cached images

model binding:
form values then route values then query string

[MaxLength(10,ErrorMessage:'')]
[Display("My Name")]

services.AddDbContext<YourDBContextClass>(options => options.UseSqlServer(connstring));

Startup cs has DI : IConfiguration which gets all configs from appsettingsjson like getConnectionStrubf













