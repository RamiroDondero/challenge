class CustomDataTime {
  
  static final day = DateTime.now().day;
  static final month = DateTime.now().month;
  static final weekday = DateTime.now().weekday;

  static final Map<int, dynamic> dia = {
    1: 'Lun',
    2: 'Mar',
    3: 'Mie',
    4: 'Jue',
    5: 'Vie',
    6: 'Sab',
    7: 'Dom',
  };

  static final Map<int, dynamic> mes = {
    1: 'Ene',
    2: 'Feb',
    3: 'Mar',
    4: 'Abr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Ago',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dic',
  };
}
