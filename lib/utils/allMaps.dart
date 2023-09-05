class indicadorClass {
  Map<String, dynamic> general;

  indicadorClass()
      : general = {
          'month3': {
            'motorGrueso': motorGrueso1,
            'motorFino': motorFino1,
            'social': social1,
            'cognitivo': cognitivo1,
          },
          'month8': {
            'motorGrueso': motorGrueso2,
            'motorFino': motorFino2,
            'social': social2,
            'cognitivo': cognitivo2,
          },
          'month12': {
            'motorGrueso': motorGrueso3,
            'motorFino': motorFino3,
            'social': social3,
            'cognitivo': cognitivo3,
          },
          'month18': {
            'motorGrueso': motorGrueso4,
            'motorFino': motorFino4,
            'social': social4,
            'cognitivo': cognitivo4,
          },
          'month24': {
            'motorGrueso': motorGrueso24,
            'motorFino': motorFino24,
            'social': social24,
            'cognitivo': cognitivo24,
          },
          'year3': {
            'motorGrueso': motorGrueso3y,
            'motorFino': motorFino3y,
            'social': social3y,
            'cognitivo': cognitivo3y,
          },
          'year4': {
            'motorGrueso': motorGrueso4y,
            'motorFino': motorFino4y,
            'social': social4y,
            'cognitivo': cognitivo4y,
          }
        };

  void setData(Map<String, dynamic> newData) {
    general = newData;
  }

  dynamic getMont(int numberMont) {
    print('llego a la func con este number' + numberMont.toString());
    switch (numberMont) {
      case < 0:
        {
          print('entro al case 0');
          return {};
        }
      case >= 0 && < 8:
        {
          print('entro al primero');
          print(general['month3']);
          return general['month3'];
        }
      case >= 8 && < 12:
        {
          return general['month8'];
        }
      case >= 12 && < 18:
        {
          return general['month12'];
        }
      case >= 18 && < 24:
        {
          return general['month18'];
        }
      case >= 24 && < 36:
        {
          return general['year3'];
        }
      default:
        {
          return general['year4'];
        }
    }
  }

  void setMont(dynamic newMonth, int numberMont) {
    switch (numberMont) {
      case < 0:
        {
          print('no hay ese año');
        }
      case >= 0 && < 8:
        {
          general['month3'] = newMonth;
        }
      case >= 8 && < 12:
        {
          general['month8'] = newMonth;
        }
      case >= 12 && < 18:
        {
          general['month12'] = newMonth;
        }
      case >= 18 && < 24:
        {
          general['month18'] = newMonth;
        }
      case >= 24 && < 36:
        {
          general['year3'] = newMonth;
        }
      default:
        {
          general['year4'] = newMonth;
        }
    }
  }
}

var motorGrueso1 = {
  'Rueda de adelante hacia atrás': '',
  'Controlar el movimiento de la cabeza y el cuello al sentarse': '',
  'Levantar la cabeza y el pecho cuando se acuesta boca abajo': '',
  'Estirar y patear las piernas cuando están acostados boca abajo o boca arriba':
      '',
  'empujar hacia abajo con las piernas cuando los pies están sobre una superficie firme':
      '',
};

var motorFino1 = {
  'Juntar sus manos': '',
  'Abrir y cerrar sus manos': '',
  'Llévese las manos a la boca': '',
  'Golpea un objeto colgante': '',
};

var social1 = {
  'Sonríe cuando sonríes y por su cuenta': '',
  'Ser expresivo y comunicarse con su rostro y cuerpo': '',
  'Copiar algunos movimientos corporales y expresiones faciales': '',
};

var cognitivo1 = {
  'Mira las caras de cerca': '',
  'Seguir objetos en movimiento': '',
  'Reconocer objetos y personas que conocen': '',
};

//-------------------------//

var motorGrueso2 = {
  'Rueda en ambos sentidos (de adelante hacia atrás, de atrás hacia adelante)':
      '',
  'Siéntate solo': '',
  'Apoyar todo su peso sobre sus piernas': '',
  'Controlar la parte superior del cuerpo y los brazos': '',
};

var motorFino2 = {
  'Sostenga y agite un juguete de mano': '',
  'Mover un objeto de una mano a otra': '',
  'Usar sus manos para explorar un objeto': '',
};

var social2 = {
  'Alcanzar a una persona que conocen': '',
  'Sonreírse a sí mismos en un espejo': '',
  'Responder cuando otros expresan emociones': '',
  'Copiar sonidos de voz': '',
};

var cognitivo2 = {
  'Rastrear un objeto en movimiento y encontrar uno que esté parcialmente oculto':
      '',
  'Explora con las manos y la boca': '',
  'Lucha para conseguir objetos que están fuera de su alcance': '',
  'Mirar de un objeto a otro': '',
  'Ver un objeto que cae': '',
};

//----------------month12------------------//

var motorGrueso3 = {
  'Alcanzar una posición sentada sin ayuda': '',
  'Gatear sobre las manos y las rodillas, o deslizarse sobre su trasero': '',
  'Pasar de una posición sentada a una posición de gateo o boca abajo (boca abajo)':
      '',
  'Tire hacia arriba a una posición de pie': '',
  'Crucero, aferrarse a los muebles': '',
  'Párese brevemente sin apoyo': '',
  'Camina sosteniendo la mano de un adulto, y tal vez da 2 o 3 pasos por su cuenta':
      '',
  'Empieza a subir escaleras con ayuda': '',
};

var motorFino3 = {
  'Alimentación con el dedo con el pulgar y el índice (agarre de pinza)': '',
  'Poner objetos en un recipiente (y sacarlos de nuevo)': '',
  'Liberar objetos voluntariamente': '',
  'Pinchar con un dedo índice': '',
  'Empuja un juguete': '',
  'Comenzar a beber de una taza': '',
  'Garabatear con un crayón': '',
  'Comience a usar una cuchara': '',
};

var social3 = {
  'Ser tímido o ansioso con extraños': '',
  'Copiar durante la reproducción': '',
  'Tener juguetes y personas favoritas': '',
  'Probar los límites de las acciones y comportamientos': '',
  'Coloque un brazo o una pierna para ayudar al vestirse': '',
  'Quítate los calcetines': '',
  'Ven cuando se te llama (responde al nombre)': '',
  'Diga "mamá" o "papá" con al menos otra palabra con significado': '',
  'Comunicar una necesidad sin llorar': '',
  'Detén una acción si dices "No"': '',
};

var cognitivo3 = {
  'Explorar objetos de diferentes maneras (temblando, golpeando, lanzando, dejándose caer)':
      '',
  'Conocer los nombres de objetos familiares': '',
  'Responder a la música': '',
  'Comience a explorar la causa y el efecto': '',
};

//-------------month18-------------//

var motorGrueso4 = {
  'Súbete a las sillas': '',
  'Camina sin ayuda': '',
  'Sube escaleras de una en una con ayuda': '',
};

var motorFino4 = {
  'Construye una torre de 3 bloques': '',
  'Use bien una cuchara': '',
  'Pasar algunas páginas de libros de cartón a la vez': '',
  'Voltee un recipiente para verter el contenido': '',
  'Bebe fácilmente de una taza': '',
};

var social4 = {
  'Decir 20 o más palabras': '',
  'Siga una instrucción simple': '',
  'Quítense algo de ropa por su cuenta': '',
  'Apuntar a una parte del cuerpo con nombre': '',
  'Señale objetos familiares cuando se le pregunte': '',
  'Ayuda con tareas sencillas': '',
};

var cognitivo4 = {
  'Usar objetos como herramientas': '',
  'Encajar objetos relacionados (por ejemplo, en un clasificador de formas)':
      '',
};

//----------------month24--------------//
var motorGrueso24 = {
  'Tira de un juguete mientras caminas': '',
  'Lleve un juguete grande o más de un juguete mientras camina': '',
  'Comience a correr': '',
  'Patear o lanzar una pelota': '',
  'Subir y bajar de las sillas sin ayuda': '',
  'Sube y baja escaleras con ayuda': '',
};

var motorFino24 = {
  'Construye una torre de 4 bloques o más': '',
  'Completa un rompecabezas simple que combina formas': '',
  'Pase las páginas del libro de cartón fácilmente, una a la vez': '',
};

var social24 = {
  'Empieza a juntar 2 palabras': '',
  'Copiar el comportamiento de los adultos y otros niños': '',
  'Emocionarse por estar con otros niños': '',
  'Jugar junto a otros niños': '',
  'Mostrar una independencia creciente': '',
  'Mostrar un comportamiento desafiante': '',
};

var cognitivo24 = {
  'Comienza el juego "imaginario"': '',
};

//----------------------Year 3--------------------//
var motorGrueso3y = {
  'Subir y bajar escaleras, alternando pies (un pie por escalera)': '',
  'Corre fácilmente': '',
  'Saltar en su lugar': '',
  'Lanzar una pelota por encima de la cabeza': '',
};

var motorFino3y = {
  'Hacer líneas hacia arriba y hacia abajo, de lado a lado y circulares con un lápiz o crayón':
      '',
  'Construye una torre de más de 6 bloques': '',
  'Sostenga un lápiz en una posición de escritura': '',
  'Atornillar y desenroscar tapas de frascos o tuercas y pernos grandes': '',
  'Cuerdas de cuentas grandes': '',
  'Pestillos y ganchos de trabajo': '',
  'Recortar con tijeras para niños': '',
};

var social3y = {
  'mostrar afecto espontáneo por los compañeros de juego que conocen': '',
  'Comience a turnarse': '',
  'Entender el concepto de "mío" vs. "de otra persona"': '',
  'Objetar cambios en la rutina': '',
  'Anticipar las actividades diarias': '',
  'Habla en oraciones y haz muchas preguntas': '',
  'Guarde los juguetes': '',
  'Pide ayuda': '',
  'Conoce su nombre completo': '',
};

var cognitivo3y = {
  'Hacer coincidir un objeto en su mano o la habitación con una imagen en un libro':
      '',
  'Incluye animales, muñecas y personas en juegos de fantasía': '',
  'Ordenar fácilmente por forma y color': '',
  'Completa un rompecabezas con 3 o 4 piezas': '',
  'Entender la diferencia entre 1 y 2': '',
  'Nombre de las partes del cuerpo y colores': '',
};

//--------------------year 4----------------//

var motorGrueso4y = {
  'Salta y párate en 1 pie durante un máximo de 4 segundos': '',
  'Patear una pelota hacia adelante': '',
  'Atrapa una pelota que rebota': '',
};

var motorFino4y = {
  'Dibujar a una persona con 2 a 4 partes del cuerpo': '',
  'Use tijeras para niños': '',
  'Dibujar círculos y cuadrados': '',
  'Pulgares giratorios': '',
  'Hacer una secuencia de dedo a pulgar (por ejemplo, Itsy-Bitsy Spider)': '',
};

var social4y = {
  'Esperamos nuevas experiencias': '',
  'Cooperar con otros niños': '',
  'Jugar "Mamá" o "Papá"': '',
  'Ser muy inventivo': '',
  'Vestir y desvestir': '',
  'Imagina monstruos': '',
  'Negociar soluciones a los conflictos': '',
};

var cognitivo4y = {
  'Entender el conteo': '',
  'Siga una instrucción de 3 partes': '',
  'Recordar partes de una historia': '',
  'Inventar y contar historias sencillas': '',
  'Entender "igual" y "diferente"': '',
  'Disfruta del juego de fantasía': '',
  'Conocer su dirección': '',
};
