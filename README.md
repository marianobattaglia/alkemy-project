# alkemy-project
Alchemy Challenge iOS dev with xcode 13.2.1 for devices iOS 15.2. 
The app has a first login view that is configured to enter a properly formatted mailbox, in case of error it will show an alert. The second view is a list of popular movies taken for TMDb API, has a tab controller on the bottom to go to the other view that shows the movies you select as favorite. The app is responsive for all display sizes only in portrait tested in iPhone 8 to 13 Pro Max. 
The app meets the requirement of the challenge. It takes Alamofire for petitions, MVVM arquitecture, and the views are made with xibs (no storyboards).

# Challenge description
Objetivo
El objetivo de este challenge es desarrollar una aplicación iOS utilizando una API que posee películas, programas de televisión y artistas: API Overview — The Movie Database (TMDb). Esta API es gratuita y requiere registrarse previamente ya que se necesitará una clave (key) para que los endpoints respondan correctamente.
La app deberá tener una pantalla principal en donde se muestre una lista de películas populares (ver The Movie Database API) con sus respectivos títulos.
Cada una de esas películas podrá ser seleccionada y se desplegará una nueva vista con los detalles de la misma (género, idioma original, popularidad, fecha de estreno, entre otras). Para ello, consultar el siguiente endpoint: The Movie Database API.
En caso de que alguna consulta falle o algún listado esté vacío deberán mostrarse los correspondientes errores en pantalla.

Requisitos técnicos
  ● Alamofire para las peticiones.
  ● Arquitectura MVVM.
  ● Realización de vistas con xibs (no storyboards).

¿Qué se evaluará?
  ● Consistencia de la aplicación: Bajo ningún punto de vista, la aplicación deberá cerrarse inesperadamente.
  ● Diseños: Los diseños de las vistas solicitadas quedarán a criterio del desarrollador y deberán ser flexibles de acuerdo a las dimensiones de los dispositivos.
  ● Experiencia de usuario: La aplicación deberá ser intuitiva, de fácil uso y los errores que se muestren en pantalla tendrán que ser de fácil interpretación.
  ● Calidad de código: Deberá ser legible y de fácil manipulación. En lo posible,
  que respete los estándares de la tecnología.

Adicionales
En caso de que el desarrollador cuente con tiempo podrá incorporar al proyecto una o varias de las siguientes funcionalidades:
  ● Mostrar la portada en la lista de películas.
  ● La API posee un endpoint para evaluar una película determinada (ver The
  Movie Database API). Agregar en la vista de detalle la posibilidad de evaluar
  una película y actualizar la API con dicha información.
  ● Una opción de “Favorito” para las películas. Al volver a entrar a la aplicación
  debe mostrarse las películas que estaban marcadas como “Favorito” previamente.
    ○ Agregar un TabBar:
      ■ El primer tab será la lista de películas que se tiene actualmente.
      ■ El segundo tab será la lista de las películas marcadas como favoritas.
  ● Mostrar una pantalla inicial de login, donde se le pida al usuario ingresar un
  correo de forma obligatoria para poder avanzar (validando su formato).
  ● Pruebas unitarias.
