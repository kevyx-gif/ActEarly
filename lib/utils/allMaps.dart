//Text Imports
import 'package:get/get.dart';

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
      case == 0:
        {
          return general['month3'];
        }
      case == 1:
        {
          return general['month8'];
        }
      case == 2:
        {
          return general['month12'];
        }
      case == 3:
        {
          return general['month18'];
        }
      case == 4:
        {
          return general['month24'];
        }
      case == 5:
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
  'motorGrueso1_1'.tr: '',
  'motorGrueso1_2'.tr: '',
  'motorGrueso1_3'.tr: '',
  'motorGrueso1_4'.tr: '',
  'motorGrueso1_5'.tr: '',
};

var motorFino1 = {
  'motorFino1_1'.tr : '',
  'motorFino1_2'.tr : '',
  'motorFino1_3'.tr : '',
  'motorFino1_4'.tr : '',
};

var social1 = {
  'social1_1'.tr : '',
  'social1_2'.tr : '',
  'social1_3'.tr : '',
};

var cognitivo1 = {
  'cognitivo1_1'.tr : '',
  'cognitivo1_2'.tr : '',
  'cognitivo1_3'.tr : '',
};

//-------------------------//

var motorGrueso2 = {
  'motorGrueso2_1'.tr : '',
  'motorGrueso2_2'.tr : '',
  'motorGrueso2_3'.tr : '',
  'motorGrueso2_4'.tr : '',
};

var motorFino2 = {
  'motorFino2_1'.tr : '',
  'motorFino2_2'.tr : '',
  'motorFino2_3'.tr : '',
};

var social2 = {
  'social2_1'.tr : '',
  'social2_2'.tr : '',
  'social2_3'.tr : '',
  'social2_4'.tr : '',
};

var cognitivo2 = {
  'cognitivo2_1'.tr : '',
  'cognitivo2_2'.tr : '',
  'cognitivo2_3'.tr : '',
  'cognitivo2_4'.tr : '',
  'cognitivo2_5'.tr : '',
};

//----------------month12------------------//

var motorGrueso3 = {
  'motorGrueso3_1'.tr : '',
  'motorGrueso3_2'.tr : '',
  'motorGrueso3_3'.tr : '',
  'motorGrueso3_4'.tr : '',
  'motorGrueso3_5'.tr : '',
  'motorGrueso3_6'.tr : '',
  'motorGrueso3_7'.tr : '',
  'motorGrueso3_8'.tr : '',
};

var motorFino3 = {
  'motorFino3_1'.tr : '',
  'motorFino3_2'.tr : '',
  'motorFino3_3'.tr : '',
  'motorFino3_4'.tr : '',
  'motorFino3_5'.tr : '',
  'motorFino3_6'.tr : '',
  'motorFino3_7'.tr : '',
  'motorFino3_8'.tr : '',
};

var social3 = {
  'social3_1'.tr : '',
  'social3_2'.tr : '',
  'social3_3'.tr : '',
  'social3_4'.tr : '',
  'social3_5'.tr : '',
  'social3_6'.tr : '',
  'social3_7'.tr : '',
  'social3_8'.tr : '',
  'social3_9'.tr : '',
  'social3_10'.tr : '',
};

var cognitivo3 = {
  'cognitivo3_1'.tr : '',
  'cognitivo3_2'.tr : '',
  'cognitivo3_3'.tr : '',
  'cognitivo3_4'.tr : '',
};

//-------------month18-------------//

var motorGrueso4 = {
  'motorGrueso4_1'.tr : '',
  'motorGrueso4_2'.tr : '',
  'motorGrueso4_3'.tr : '',
};

var motorFino4 = {
  'motorFino4_1'.tr : '',
  'motorFino4_2'.tr : '',
  'motorFino4_3'.tr : '',
  'motorFino4_4'.tr : '',
  'motorFino4_5'.tr : '',
};

var social4 = {
  'social4_1'.tr : '',
  'social4_2'.tr : '',
  'social4_3'.tr : '',
  'social4_4'.tr : '',
  'social4_5'.tr : '',
  'social4_6'.tr : '',
};

var cognitivo4 = {
  'cognitivo4_1'.tr : '',
  'cognitivo4_2'.tr : '',
};

//----------------month24--------------//
var motorGrueso24 = {
  'motorGrueso24_1'.tr : '',
  'motorGrueso24_2'.tr : '',
  'motorGrueso24_3'.tr : '',
  'motorGrueso24_4'.tr : '',
  'motorGrueso24_5'.tr : '',
  'motorGrueso24_6'.tr : '',
};

var motorFino24 = {
  'motorFino24_1'.tr : '',
  'motorFino24_2'.tr : '',
  'motorFino24_3'.tr : '',
};

var social24 = {
  'social24_1'.tr : '',
  'social24_2'.tr : '',
  'social24_3'.tr : '',
  'social24_4'.tr : '',
  'social24_5'.tr : '',
  'social24_6'.tr : '',
};

var cognitivo24 = {
  'cognitivo24_1'.tr : '',
};

//----------------------Year 3--------------------//
var motorGrueso3y = {
  'motorGrueso3y_1'.tr : '',
  'motorGrueso3y_2'.tr : '',
  'motorGrueso3y_3'.tr : '',
  'motorGrueso3y_4'.tr : '',
};

var motorFino3y = {
  'motorFino3y_1'.tr : '',
  'motorFino3y_2'.tr : '',
  'motorFino3y_3'.tr : '',
  'motorFino3y_4'.tr : '',
  'motorFino3y_5'.tr : '',
  'motorFino3y_6'.tr : '',
  'motorFino3y_7'.tr : '',
};

var social3y = {
  'social3y_1'.tr : '',
  'social3y_2'.tr : '',
  'social3y_3'.tr : '',
  'social3y_4'.tr : '',
  'social3y_5'.tr : '',
  'social3y_6'.tr : '',
  'social3y_7'.tr : '',
  'social3y_8'.tr : '',
  'social3y_9'.tr : '',
};

var cognitivo3y = {
  'cognitivo3y_1'.tr : '',
  'cognitivo3y_2'.tr : '',
  'cognitivo3y_3'.tr : '',
  'cognitivo3y_4'.tr : '',
  'cognitivo3y_5'.tr : '',
  'cognitivo3y_6'.tr : '',
};

//--------------------year 4----------------//

var motorGrueso4y = {
  'motorGrueso4y_1'.tr : '',
  'motorGrueso4y_2'.tr : '',
  'motorGrueso4y_3'.tr : '',
};

var motorFino4y = {
  'motorFino4y_1'.tr : '',
  'motorFino4y_2'.tr : '',
  'motorFino4y_3'.tr : '',
  'motorFino4y_4'.tr : '',
  'motorFino4y_5'.tr : '',
};

var social4y = {
  'social4y_1'.tr : '',
  'social4y_2'.tr : '',
  'social4y_3.tr' : '',
  'social4y_4'.tr : '',
  'social4y_5'.tr : '',
  'social4y_6'.tr : '',
  'social4y_7'.tr : '',
};

var cognitivo4y = {
  'cognitivo4y_1'.tr : '',
  'cognitivo4y_2'.tr : '',
  'cognitivo4y_3'.tr : '',
  'cognitivo4y_4'.tr : '',
  'cognitivo4y_5'.tr : '',
  'cognitivo4y_6'.tr : '',
  'cognitivo4y_7'.tr : '',
};
