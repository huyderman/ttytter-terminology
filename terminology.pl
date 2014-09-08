$handle = sub {
  my $ref = shift;
  my $menu_select = $ref->{'menu_select'};
  
  $menu_select = (length($menu_select) && !$script)
    ? (($menu_select =~ /^z/) ?
      "${EM}${menu_select}>${OFF} " :
      "${menu_select}> ")
    : '';

  print $stdout (
    $menu_select,
    "\033}ic#3;1;", &descape($ref->{'user'}->{'profile_image_url'}), "\000",
    "\033}ib\000###\033}ie\000",
    &standardtweet($ref)
  );
  return 1;
};

$dmhandle = sub {
  my $ref = shift;

  print $stdout (
    "\033}ic#3;1;", &descape($ref->{'sender'}->{'profile_image_url'}), "\000",
    "\033}ib\000###\033}ie\000",
    &standarddm($ref)
  );
  return 1;
};