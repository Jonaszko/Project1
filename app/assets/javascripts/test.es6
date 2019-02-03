const getWeather = (e) => {
  let weatherElem = document.querySelector('#js-weather');
  
  setInterval(() => {

	fetch('/weather.json?city=Poznan,pl').then((response) => {
	    return response.json();
	  }).then((data) => {
	    weatherElem.innerHTML = 'Temperatura: ' + Math.round(data.temp_celsius);
	    //console.log(data);
	  }).catch((err) => {
	    console.log(err);
	  });
  }, 10000);
 }

window.addEventListener('load', getWeather)

window.addEventListener('load', (e) => {
	navElem = document.querySelector('nav');

	navElem.addEventListener('mouseover', (e) => {
	  navElem.style.opacity = 0.1;
	});

	navElem.addEventListener('mouseout', (e) => {
	  navElem.style.opacity = 1;
	});

})