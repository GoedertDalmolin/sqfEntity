// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SqfEntityFormGenerator
// **************************************************************************

part of 'model.dart';

class ProductAdd extends StatefulWidget {
  ProductAdd(this._product);
  final dynamic _product;
  @override
  State<StatefulWidget> createState() => ProductAddState(_product as Product);
}

class ProductAddState extends State {
  ProductAddState(this.product);
  Product product;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();

  List<DropdownMenuItem<int>> _dropdownMenuItemsForCategoryId =
      <DropdownMenuItem<int>>[];
  int? _selectedCategoryId;

  final TextEditingController txtRownum = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  final TextEditingController txtDatetime = TextEditingController();
  final TextEditingController txtTimeForDatetime = TextEditingController();
  final TextEditingController txtDate = TextEditingController();
  final TextEditingController txtDateCreated = TextEditingController();
  final TextEditingController txtTimeForDateCreated = TextEditingController();

  @override
  void initState() {
    txtName.text = product.name == null ? '' : product.name.toString();
    txtDescription.text =
        product.description == null ? '' : product.description.toString();
    txtPrice.text = product.price == null ? '' : product.price.toString();

    txtRownum.text = product.rownum == null ? '' : product.rownum.toString();
    txtImageUrl.text =
        product.imageUrl == null ? '' : product.imageUrl.toString();
    txtDatetime.text =
        product.datetime == null ? '' : UITools.convertDate(product.datetime!);
    txtTimeForDatetime.text =
        product.datetime == null ? '' : UITools.convertTime(product.datetime!);

    txtDate.text =
        product.date == null ? '' : UITools.convertDate(product.date!);
    txtDateCreated.text = product.dateCreated == null
        ? ''
        : UITools.convertDate(product.dateCreated!);
    txtTimeForDateCreated.text = product.dateCreated == null
        ? ''
        : UITools.convertTime(product.dateCreated!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void buildDropDownMenuForCategoryId() async {
      final dropdownMenuItems =
          await Category().select().toDropDownMenuInt('name');
      setState(() {
        _dropdownMenuItemsForCategoryId = dropdownMenuItems;
        _selectedCategoryId = product.categoryId;
      });
    }

    if (_dropdownMenuItemsForCategoryId.isEmpty) {
      buildDropDownMenuForCategoryId();
    }
    void onChangeDropdownItemForCategoryId(int? selectedCategoryId) {
      setState(() {
        _selectedCategoryId = selectedCategoryId;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: (product.id == null)
            ? Text('Add a new product')
            : Text('Edit product'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildRowName(),
                    buildRowDescription(),
                    buildRowPrice(),
                    buildRowIsActive(),
                    buildRowCategoryId(onChangeDropdownItemForCategoryId),
                    buildRowImageUrl(),
                    buildRowDatetime(),
                    buildRowDate(),
                    buildRowDateCreated(),
                    TextButton(
                      child: saveButton(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          save();
                          /* Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Processing Data')));
                           */
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildRowName() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Name';
        }
        return null;
      },
      controller: txtName,
      decoration: InputDecoration(labelText: 'Name'),
    );
  }

  Widget buildRowDescription() {
    return TextFormField(
      controller: txtDescription,
      decoration: InputDecoration(labelText: 'Description'),
    );
  }

  Widget buildRowPrice() {
    return TextFormField(
      validator: (value) {
        if (value!.isNotEmpty && double.tryParse(value) == null) {
          return 'Please Enter valid number';
        }

        return null;
      },
      controller: txtPrice,
      decoration: InputDecoration(labelText: 'Price'),
    );
  }

  Widget buildRowIsActive() {
    return Row(
      children: <Widget>[
        Text('IsActive?'),
        Checkbox(
          value: product.isActive ?? false,
          onChanged: (bool? value) {
            setState(() {
              product.isActive = value;
            });
          },
        ),
      ],
    );
  }

  Widget buildRowCategoryId(
      void Function(int? selectedCategoryId)
          onChangeDropdownItemForCategoryId) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('Category'),
        ),
        Expanded(
            flex: 2,
            child: Container(
              child: DropdownButtonFormField(
                value: _selectedCategoryId,
                items: _dropdownMenuItemsForCategoryId,
                onChanged: onChangeDropdownItemForCategoryId,
                validator: (value) {
                  return null;
                },
              ),
            )),
      ],
    );
  }

  Widget buildRowRownum() {
    return TextFormField(
      validator: (value) {
        if (value!.isNotEmpty && int.tryParse(value) == null) {
          return 'Please Enter valid number';
        }

        return null;
      },
      controller: txtRownum,
      decoration: InputDecoration(labelText: 'Rownum'),
    );
  }

  Widget buildRowImageUrl() {
    return TextFormField(
      controller: txtImageUrl,
      decoration: InputDecoration(labelText: 'ImageUrl'),
    );
  }

  Widget buildRowDatetime() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Datetime';
        }
        return null;
      },
      controller: txtDatetime,
      decoration: InputDecoration(labelText: 'Datetime'),
    );
  }

  Widget buildRowDate() {
    return TextFormField(
      controller: txtDate,
      decoration: InputDecoration(labelText: 'Date'),
    );
  }

  Widget buildRowDateCreated() {
    return TextFormField(
      controller: txtDateCreated,
      decoration: InputDecoration(labelText: 'DateCreated'),
    );
  }

  Container saveButton() {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(95, 66, 119, 1.0),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void save() async {
    var _datetime = DateTime.tryParse(txtDatetime.text);
    final _datetimeTime = DateTime.tryParse(txtTimeForDatetime.text);
    if (_datetime != null && _datetimeTime != null) {
      _datetime = _datetime.add(Duration(
          hours: _datetimeTime.hour,
          minutes: _datetimeTime.minute,
          seconds: _datetimeTime.second));
    }
    final _date = DateTime.tryParse(txtDate.text);
    var _dateCreated = DateTime.tryParse(txtDateCreated.text);
    final _dateCreatedTime = DateTime.tryParse(txtTimeForDateCreated.text);
    if (_dateCreated != null && _dateCreatedTime != null) {
      _dateCreated = _dateCreated.add(Duration(
          hours: _dateCreatedTime.hour,
          minutes: _dateCreatedTime.minute,
          seconds: _dateCreatedTime.second));
    }

    product
      ..name = txtName.text
      ..description = txtDescription.text
      ..price = double.tryParse(txtPrice.text)
      ..categoryId = _selectedCategoryId
      ..rownum = int.tryParse(txtRownum.text)
      ..imageUrl = txtImageUrl.text
      ..datetime = _datetime
      ..date = _date
      ..dateCreated = _dateCreated;
    await product.save();
    if (product.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(product.saveResult.toString(),
          title: 'save Product Failed!', callBack: () {});
    }
  }
}

class CategoryAdd extends StatefulWidget {
  CategoryAdd(this._category);
  final dynamic _category;
  @override
  State<StatefulWidget> createState() =>
      CategoryAddState(_category as Category);
}

class CategoryAddState extends State {
  CategoryAddState(this.category);
  Category category;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtName = TextEditingController();

  final TextEditingController txtDateCreated = TextEditingController();
  final TextEditingController txtTimeForDateCreated = TextEditingController();

  @override
  void initState() {
    txtName.text = category.name == null ? '' : category.name.toString();

    txtDateCreated.text = category.dateCreated == null
        ? ''
        : UITools.convertDate(category.dateCreated!);
    txtTimeForDateCreated.text = category.dateCreated == null
        ? ''
        : UITools.convertTime(category.dateCreated!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (category.id == null)
            ? Text('Add a new category')
            : Text('Edit category'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildRowName(),
                    buildRowIsActive(),
                    buildRowDateCreated(),
                    TextButton(
                      child: saveButton(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          save();
                          /* Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Processing Data')));
                           */
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildRowName() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Name';
        }
        return null;
      },
      controller: txtName,
      decoration: InputDecoration(labelText: 'Name'),
    );
  }

  Widget buildRowIsActive() {
    return Row(
      children: <Widget>[
        Text('IsActive?'),
        Checkbox(
          value: category.isActive ?? false,
          onChanged: (bool? value) {
            setState(() {
              category.isActive = value;
            });
          },
        ),
      ],
    );
  }

  Widget buildRowDateCreated() {
    return TextFormField(
      controller: txtDateCreated,
      decoration: InputDecoration(labelText: 'DateCreated'),
    );
  }

  Container saveButton() {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(95, 66, 119, 1.0),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void save() async {
    var _dateCreated = DateTime.tryParse(txtDateCreated.text);
    final _dateCreatedTime = DateTime.tryParse(txtTimeForDateCreated.text);
    if (_dateCreated != null && _dateCreatedTime != null) {
      _dateCreated = _dateCreated.add(Duration(
          hours: _dateCreatedTime.hour,
          minutes: _dateCreatedTime.minute,
          seconds: _dateCreatedTime.second));
    }

    category
      ..name = txtName.text
      ..dateCreated = _dateCreated;
    await category.save();
    if (category.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(category.saveResult.toString(),
          title: 'save Category Failed!', callBack: () {});
    }
  }
}

class TodoAdd extends StatefulWidget {
  TodoAdd(this._todos);
  final dynamic _todos;
  @override
  State<StatefulWidget> createState() => TodoAddState(_todos as Todo);
}

class TodoAddState extends State {
  TodoAddState(this.todos);
  Todo todos;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtUserId = TextEditingController();
  final TextEditingController txtTitle = TextEditingController();

  final TextEditingController txtDateCreated = TextEditingController();
  final TextEditingController txtTimeForDateCreated = TextEditingController();

  @override
  void initState() {
    txtUserId.text = todos.userId == null ? '' : todos.userId.toString();
    txtTitle.text = todos.title == null ? '' : todos.title.toString();

    txtDateCreated.text = todos.dateCreated == null
        ? ''
        : UITools.convertDate(todos.dateCreated!);
    txtTimeForDateCreated.text = todos.dateCreated == null
        ? ''
        : UITools.convertTime(todos.dateCreated!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            (todos.id == null) ? Text('Add a new todos') : Text('Edit todos'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildRowId(),
                    buildRowUserId(),
                    buildRowTitle(),
                    buildRowCompleted(),
                    buildRowDateCreated(),
                    TextButton(
                      child: saveButton(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          save();
                          /* Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Processing Data')));
                           */
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildRowId() {
    return TextFormField(
      validator: (value) {
        if (value!.isNotEmpty && int.tryParse(value) == null) {
          return 'Please Enter valid number';
        }

        return null;
      },
      controller: txtId,
      decoration: InputDecoration(labelText: 'Id'),
    );
  }

  Widget buildRowUserId() {
    return TextFormField(
      validator: (value) {
        if (value!.isNotEmpty && int.tryParse(value) == null) {
          return 'Please Enter valid number';
        }

        return null;
      },
      controller: txtUserId,
      decoration: InputDecoration(labelText: 'UserId'),
    );
  }

  Widget buildRowTitle() {
    return TextFormField(
      controller: txtTitle,
      decoration: InputDecoration(labelText: 'Title'),
    );
  }

  Widget buildRowCompleted() {
    return Row(
      children: <Widget>[
        Text('Completed?'),
        Checkbox(
          value: todos.completed ?? false,
          onChanged: (bool? value) {
            setState(() {
              todos.completed = value;
            });
          },
        ),
      ],
    );
  }

  Widget buildRowDateCreated() {
    return TextFormField(
      controller: txtDateCreated,
      decoration: InputDecoration(labelText: 'DateCreated'),
    );
  }

  Container saveButton() {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(95, 66, 119, 1.0),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void save() async {
    var _dateCreated = DateTime.tryParse(txtDateCreated.text);
    final _dateCreatedTime = DateTime.tryParse(txtTimeForDateCreated.text);
    if (_dateCreated != null && _dateCreatedTime != null) {
      _dateCreated = _dateCreated.add(Duration(
          hours: _dateCreatedTime.hour,
          minutes: _dateCreatedTime.minute,
          seconds: _dateCreatedTime.second));
    }

    todos
      ..id = int.tryParse(txtId.text)
      ..userId = int.tryParse(txtUserId.text)
      ..title = txtTitle.text
      ..dateCreated = _dateCreated;
    await todos.save();
    if (todos.saveResult!.success) {
      Navigator.pop(context, true);
    } else {
      UITools(context).alertDialog(todos.saveResult.toString(),
          title: 'save Todo Failed!', callBack: () {});
    }
  }
}
