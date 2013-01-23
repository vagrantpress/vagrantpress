class php5::install{
  package{"php5": ensure=>present,}
  package{"php5-mysql": ensure=>present,}
  package{"libapache2-mod-php5": ensure=>present,}
}