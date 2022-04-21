// add folder "server" and npm init to add package json file

// npm i express  - in package.json' dependencies u can find express now and node modules is created as express dependencies is in node modules

// create app.js entry file
// require express and invoke it
const app = express();

// add a request handler for route
app.get("/", customMiddleware, (req, res) => {
  res.send("hello world");
});

// listen to a port
app.listen(PORT, () => console.log("listening to port", PORT));

// Middleware : func thats is execeuted before the request is handled to request handlers
app.use(customMiddleware); // mw for all routes

const customMiddleware = (req, res, next) => {
  // ...
  next(); // to call next mw if any or futher code
};

// Mongodb atlas in cloud:
// creat project
// create cluster with default configuration
// whitelist an IP address - connect to db from an ip Address
//create a db user with user name and password
//goto cluster and connect to application, it gives a connection string
//npm i mongoose

mongoose.connect(MONGO_URI);
mongoose.connection.on("connected", cb);
mongoose.connection.on("error", cb);

// use express router for handling routes
// for parsing json request, use express json mw

// mongoose model : user create schema like name : type:string and required:
// use model, User.save, User.findOne({email:email}), User.find(), findByIdAnddate - return promises

//requireLogin mw
//SIGN IN - jwt.sign({_id:}, JWTSERCRET)
//jwt mw = jwt.verify(token, JWTSERCRET , (err , payload) =>{ req.id = payload._id}))

// Post : postedBy :{
//     type:ObjectID,
//     ref: User
// }

//expand or popuplated postedby user : .populate("psostedBy","id name")
//contract .selct("-passwrd")
//CRA

//use formdata for uploading file and append stuffs and post it to cloudinary
//get cloudinary url and store this ad image in db

// redux setup
//Reducer- we have multiple reducers, combine reuducer and persist it in storage using persistReducer
//STore - create store using  PersistedReducer, apply ms think and persist store
//use this persist store in PersistGate to automatically save stores each time state is updated

//redux thunk allow writing functions with logic that can interact with redux store's dispatch and get state method
//redux thunk allows u to return functions rather than jst actons

// dispatch(fun) instead of dispatch(action ) where fun can be async api call
