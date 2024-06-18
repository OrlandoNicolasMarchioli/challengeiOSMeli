Documentación del Proyecto: ChallengeiOSMeli

Introducción
Este documento describe la arquitectura, los componentes y el flujo de datos de la aplicación ChallengeiOSMeli, desarrollada utilizando la arquitectura MVVM (Model-View-ViewModel). La aplicación consume la API de Mercado Libre para mostrar productos basados en una búsqueda proporcionada por el usuario. A continuación, se detallan los puntos clave del proyecto.
Documento utilizado para el challenge: [Challenge Mobile (1).pdf](https://github.com/user-attachments/files/15878285/Challenge.Mobile.1.pdf)


Arquitectura MVVM
La arquitectura MVVM se implementa para separar las responsabilidades de la aplicación en tres componentes principales:

Model: Representa los datos y la lógica de negocio de la aplicación.
View: Define la interfaz de usuario y presenta los datos del ViewModel.
ViewModel: Actúa como un intermediario entre el Model y la View, gestionando la lógica de presentación.
Esta separación permite un código más limpio y mantenible, facilitando las pruebas y la escalabilidad.

Componentes del Proyecto
Model

SelectedProductData: Estructura que representa un producto seleccionado con todos sus atributos relevantes.
AllProductsState: Estructura que representa el estado de la vista, incluyendo la lista de productos, mensajes de error y otros indicadores de estado.
View

Implementada utilizando SwiftUI, proporcionando una interfaz de usuario declarativa y reactiva.
Ejemplos de vistas: ProductListView, ProductDetailView.
ViewModel

AllProductsViewModel: Gestiona la lógica de presentación de la vista de productos. Se comunica con el caso de uso DefaultProductsFetchUseCase para obtener los productos desde la API.
Utiliza Combine para gestionar la reactividad y la asincronía en la obtención de datos.
Repository

ProductsApiFetch: Implementa el protocolo AllProductsRepository para obtener productos desde la API de Mercado Libre.
ProductApi: Clase que realiza la petición HTTP a la API de Mercado Libre.

API de Mercado Libre
URL de Petición: https://api.mercadolibre.com/sites/MLA/search?q=
La aplicación realiza una petición GET a esta URL, anexando el término de búsqueda proporcionado por el usuario.

Colección de Postman
Se utilizó una colección de Postman para probar y documentar las peticiones a la API de Mercado Libre. Esta colección incluye ejemplos de peticiones con diferentes términos de búsqueda y verifica las respuestas esperadas.
[challenge Meli.postman_collection (2).json](https://github.com/user-attachments/files/15878219/challenge.Meli.postman_collection.2.json)


Frameworks Utilizados
SwiftUI: Framework de interfaz de usuario declarativa de Apple, utilizado para construir la UI de la aplicación.
Combine: Framework de reactividad de Apple, utilizado para gestionar la asincronía y la programación reactiva en la aplicación.

