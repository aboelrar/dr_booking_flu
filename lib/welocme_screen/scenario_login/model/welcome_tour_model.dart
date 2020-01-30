class welcome_tour_model {
  var _image,_page_name,_descripition;

  welcome_tour_model(this._image, this._page_name, this._descripition);

  get descripition => _descripition;

  set descripition(value) {
    _descripition = value;
  }

  get page_name => _page_name;

  set page_name(value) {
    _page_name = value;
  }

  get image => _image;

  set image(value) {
    _image = value;
  }


}