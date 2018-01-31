<%@ taglib prefix="app-tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<app-tags:header />

<div class="container">

    <div class="row">
        <div class="col-xs-12">
            <h1>React Tests</h1>
            <p>Testing out React.js with Spring Boot.</p>
        </div>
    </div>


    <div class="row">

        <!-- Test 1 -->
        <div class="col-xs-12">
            <h3>Test 1</h3>
            <p>Rendering elements with ReactDOM</p>
            <div id="test-1"></div>
        </div>

        <script type="text/babel">

          ReactDOM.render(
              <h4>Hello, world!</h4>,
              document.getElementById('test-1')
          );

        </script> <!-- /Test 1 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 2 -->
        <div class="col-xs-12">
            <h3>Test 2</h3>
            <p>Passing data into React elements</p>
            <div id="test-2"></div>
        </div>

        <script type="text/babel">

          function formatGene(gene) {
            return gene.symbol + " (" + gene.id + ")";
          }

          const gene = {
            symbol: "AKT3",
            id: 10000
          };

          const element = (
              <h4>
                Gene: {formatGene(gene)}
              </h4>
          );

          ReactDOM.render(
              element,
              document.getElementById("test-2")
          );

        </script> <!-- /Test 2 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 3 -->
        <div class="col-xs-12">
            <h3>Test 3</h3>
            <p>Creating an element and updating it with <code>setInterval</code></p>
            <div id="test-3"></div>
        </div>

        <script type="text/babel">

          function tick() {
            const element = (
              <h4>The time is now {new Date().toLocaleTimeString()}</h4>
            );
            ReactDOM.render(
                element,
                document.getElementById("test-3")
            );
          }

          setInterval(tick, 1000)

        </script> <!-- /Test 3 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 4 -->
        <div class="col-xs-12">
            <h3>Test 4</h3>
            <p>Creating reusable tags with functions</p>
            <div id="test-4"></div>
        </div>

        <script type="text/babel">

          function Welcome(props) {
            return <h4>Welcome, {props.name}</h4>;
          }

          const element = <Welcome name="Will"/>;

          ReactDOM.render(
              element,
              document.getElementById("test-4")
          );

        </script> <!-- /Test 4 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 5 -->
        <div class="col-xs-12">
            <h3>Test 5</h3>
            <p>Rendering multiple custom tags with a single function</p>
            <div id="test-5"></div>
        </div>

        <script type="text/babel">

            function Welcome(props) {
              return <h4>Welcome, {props.name}</h4>;
            }

            function App(){
              return (
                  <div>
                  <Welcome name="Will"/>
                  <Welcome name="Karen"/>
                  <Welcome name="June"/>
                  </div>
              ); // The returned elements must be a single object, that's why it is wrapped in a div
            }

            ReactDOM.render(
              <App />,
              document.getElementById("test-5")
            );

        </script> <!-- /Test 5 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 6 -->
        <div class="col-xs-12">
            <h3>Test 6</h3>
            <p>Creating component classes</p>
            <div id="test-6"></div>
        </div>

        <script type="text/babel">

            class Clock extends React.Component {

              constructor(props){
                super(props);
                this.state = {date: new Date()};
              }

              render(){
                  return (
                      <div>
                          <h4>Hello, World</h4>
                          <p>It is {this.state.date.toLocaleTimeString()}</p>
                      </div>
                  )
              }

            }

            ReactDOM.render(
                <Clock />,
                document.getElementById("test-6")
            );


        </script> <!-- /Test 6 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 7 -->
        <div class="col-xs-12">
            <h3>Test 7</h3>
            <p>Adding lifecycle events to component classes</p>
            <div id="test-7"></div>
        </div>

        <script type="text/babel">

          class Clock extends React.Component {

            constructor(props){
              super(props);
              this.state = {date: new Date()};
            }

            render(){
              return (
                  <div>
                      <h4>Hello, World</h4>
                      <p>It is {this.state.date.toLocaleTimeString()}</p>
                  </div>
              )
            }

            // runs after render() method
            componentDidMount(){
                this.timerID = setInterval(
                    () => this.tick(),
                    1000
                );
            }

            componentWillUnmount(){
                clearInterval(this.timerID);
            }

            tick(){
                this.setState({
                  date: new Date()
                });
            }

          }

          ReactDOM.render(
              <Clock />,
              document.getElementById("test-7")
          );

        </script> <!-- /Test 7 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 8 -->
        <div class="col-xs-12">
            <h3>Test 8</h3>
            <p>Event handling and accessing previous state.</p>
            <div id="test-8"></div>
        </div>

        <script type="text/babel">

          class Toggle extends React.Component {

            constructor(props){
              super(props);
              this.state = {isToggleOn: true};
              this.handleClick = this.handleClick.bind(this);
            }

            render(){
                return (
                    <button onClick={this.handleClick}>
                      {this.state.isToggleOn ? "ON" : "OFF"}
                    </button>
                );
            }

            handleClick(){
              this.setState(prevState => ({
                isToggleOn: !prevState.isToggleOn
              }));
            }

          }

          ReactDOM.render(
              <Toggle />,
              document.getElementById("test-8")
          );

        </script> <!-- /Test 8 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 9 -->
        <div class="col-xs-12">
            <h3>Test 9</h3>
            <p>Conditional rendering</p>
            <div id="test-9"></div>
        </div>

        <script type="text/babel">

            function UserGreeting(props){
              return <h3>Welcome Back!</h3>;
            }

            function GuestGreeting(props){
              return <h3>Please Log In</h3>;
            }

            function Greeting(props){
              const isLoggedIn = props.isLoggedIn;
              if (isLoggedIn){
                return <UserGreeting/>
              } else {
                return <GuestGreeting/>
              }
            }

            function LoginButton(props){
              return (
                  <button onClick={props.onClick}>
                      Login
                  </button>
              )
            }

            function LogoutButton(props){
              return (
                  <button onClick={props.onClick}>
                      Logout
                  </button>
              )
            }

            class LoginControl extends React.Component {

              constructor(props){
                super(props);
                this.state = { isLoggedIn: false };
                this.handleLoginClick = this.handleLoginClick.bind(this);
                this.handleLogOutClick = this.handleLogOutClick.bind(this);
              }

              handleLoginClick(){
                this.setState({
                    isLoggedIn: true
                });
              }

              handleLogOutClick(){
                this.setState({
                  isLoggedIn: false
                });
              }

              render(){
                const isLoggedIn = this.state.isLoggedIn;
                let button = null;
                if (isLoggedIn){
                  button = <LogoutButton onClick={this.handleLogOutClick} />;
                } else {
                  button = <LoginButton onClick={this.handleLoginClick}/>
                }
                return (
                    <div>
                        <Greeting isLoggedIn={isLoggedIn}/>
                        {button}
                    </div>
                );
              }

            }

            ReactDOM.render(
                <LoginControl/>,
                document.getElementById("test-9")
            );

        </script> <!-- /Test 9 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 10 -->
        <div class="col-xs-12">
            <h3>Test 10</h3>
            <p>Lists and Maps</p>
            <div id="test-10"></div>
        </div>

        <script type="text/babel">

            const numbers = [2,4,6,8,10];
            const listItems = numbers.map((number) =>
                    <li>{number}</li>
            );

            ReactDOM.render(
                <ul>{listItems}</ul>,
                document.getElementById("test-10")
            );

        </script>

        <div class="col-xs-12">

            <div id="test-10-b"></div>

            <script type="text/babel">

                function NumberList(props){
                  const numbers = props.numbers;
                  const listItems = numbers.map((number) =>
                          <li key={number.toString()} >
                            {number}
                          </li>
                  );
                  return (
                          <ul>{listItems}</ul>
                  );
                }

                const numbers = [2,4,6,8,10];
                ReactDOM.render(
                    <NumberList numbers={numbers}/>,
                    document.getElementById("test-10-b")
                );

            </script>

        </div>

        <div class="col-xs-12">

            <div id="test-10-c"></div>

            <script type="text/babel">

              function GeneList(props){
                const genes = props.genes;
                const listItems = genes.map((gene) =>
                        <li key={gene.id} >
                          {gene.symbol}
                        </li>
                );
                return (
                        <ul>{listItems}</ul>
                );
              }

              const genes = [
                {id: "1", symbol: "AKT1"},
                {id: "2", symbol: "AKT2"},
                {id: "3", symbol: "AKT3"}
              ];

              ReactDOM.render(
                  <GeneList genes={genes}/>,
                  document.getElementById("test-10-c")
              );

            </script>

        </div>

        <div class="col-xs-12"><hr></div>

        <!-- Test 11 -->
        <div class="col-xs-12">
            <h3>Test 11</h3>
            <p>Forms</p>
            <div id="test-11"></div>
        </div>

        <script type="text/babel">

          class NameForm extends React.Component {

            constructor(props){
                super(props);
                this.state = { value: "" };
                this.handleChange = this.handleChange.bind(this);
                this.handleSubmit = this.handleSubmit.bind(this);
            }

            handleChange(event){
                this.setState({value: event.target.value});
            }

            handleSubmit(event){
                alert("A name was submitted: " + event.state.value);
                event.preventDefault();
            }

            render(){

                return (
                    <form onSubmit={this.handleSubmit}>
                        <label>
                            Name:
                            <input type="text" value={this.state.value} onChange={this.handleChange} />
                        </label>
                        <input type="submit" value="Submit" />
                    </form>
                );

            }

          }

          ReactDOM.render(
            <NameForm/>,
            document.getElementById("test-11")
          );

        </script> <!-- /Test 11 -->


    </div>




</div>

<app-tags:footer />

