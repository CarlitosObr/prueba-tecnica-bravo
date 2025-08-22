<h2 align="center" style="border-bottom: none">Challenge Bravo</h2>

The implementation of the current weather display and the forecast (both hourly and daily) for any searched city was resolved using the [OpenWeather](https://openweathermap.org/) API and the [Phoenix](https://www.phoenixframework.org) framework for [Elixir Language](https://elixir-lang.org/). A **user interface** was developed to simplify interaction and provide a clear, accessible view of the weather data.

## 💡 Solution

With the help of the base template generated when creating a new Phoenix project, a simple page was built in the classic way. Using various HTML elements and some JavaScript, an interface was created capable of retrieving local data through a model backed by an SQLite3 database, which is used for data persistence and storing favorite cities. Controllers serve as the bridge to call the application’s logic, while the views can be rendered and presented in a user-friendly way to the end user.

### Simple UI

<table>
  <tr>
    <td>
    <img src="https://github.com/CarlitosObr/prueba-tecnica-bravo/blob/main/images/search_page.png" alt="Search" width=100%>
    <div align="center">
        <br><br>
        <div>A search bar is added to look up cities and display a list of matches, with each match having the option to be marked as a favorite.</div><br>
        <br><br>
    </div>
    </td>
    <td>
    <img src="https://github.com/CarlitosObr/prueba-tecnica-bravo/blob/main/images/favorites_page.png" alt="Favorite city" width=100%>
    <div align="center">
        <br><br>
        <div>Display the list with the cities marked as favorites, in order to view their weather.</div><br>
        <br><br>
    </div>
    </td>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/CarlitosObr/prueba-tecnica-bravo/blob/main/images/weather_first.png" alt="Current weather">
    <div align="center">
        <br><br>
        <div>Card showing the current weather, the maximum, the minimum, and what the weather will be like 24 hours after the current time.</div><br>
        <br><br>
    </div>
    </td>
    <td>
      <img src="https://github.com/CarlitosObr/prueba-tecnica-bravo/blob/main/images/weather_second.png" alt="Left days">
    <div align="center">
        <br><br>
        <div>Different cards that show what the weather will be like on the remaining days of the week.</div><br>
        <br><br>
    </div>
    </td>
  </tr>
</table>

## 📦 Architecture explanation

<table>
  <tr>
    <td colspan="2" align="center" >
      <img src="https://github.com/CarlitosObr/prueba-tecnica-bravo/blob/main/images/MVC.png" alt="MVC" width=60%>
    <div align="center">
        <br><br>
        <div>A simple architecture such as MVC was used, which is easy to understand and manage, and fits well with the way the Phoenix framework is designed. With the help of controllers that receive user requests—whether from a UI or an API—calls are made to the models. In this case, a model was created to store favorite cities. The process was straightforward, as database migrations are defined through commands executed within the framework. Using various methods, the required queries can be performed, whether an insert, delete, update, or simply retrieving the necessary data so that the controller can return, through the view, the information initially requested by the user. This is the way the architecture works, and it was the approach used to resolve this problem.</div><br>
        <br><br>
    </div>
    </td>
  </tr>
</table>