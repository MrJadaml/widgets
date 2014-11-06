#This is how you CRUD:

####Terminal
rails new widgets --database=postgresql
cd widgets
bundle
rake db:create

~open new terminal tab which will be dedicated to your rails server
rails s

####Browser
go to localhost3000

#Terminal
rails g migration MyWidgetsAndThings
atom .

####Atom
Go to:
>> db/migrate/395843344737_my_widgets_and_things.rb
create a new database table with the following code:

```Ruby
  create_table :widgets do |t|
    t.string :name
    t.string :description
    t.integer :age
  end
```
Datatypes to choose from: http://stackoverflow.com/questions/17918117/rails-4-datatypes

#Terminal
rake db:migrate


####Atom
>>> config/routes.rb
delete all the commented out text and add the following code:

```Ruby
  resources :widgets

  root 'widgets#index'
```

>>> app/controllers
create a folder named the same as db and a file in that folder named
widgets_controller.rb and drop in the following code:

```Ruby
class WidgetsController < ApplicationController

  def index
  end

end
```
* check 3000

>>> app/views
create a folder named widgets
create a file named index.html.erb

drop in the following code:
```Html
  <h1>Widgets</h1>
  <%= link_to "New Widget", new_widget_path %>

```
* check 3000

>>> app/controllers/widgets_controller.rb
drop in the following code:
```Ruby
  def new
  end
```
* check 3000

>>> app/views
create a file named new.html.erb
drop in the following code:
```Html
  <h1>Widget Factory</h1>
  <%= form_for @widget do |f| %>
    <%= f.label :name %>
    <%= f.text_field :name %>

    <%= f.label :description %>
    <%= f.text_field :description %>

    <%= f.label :age %>
    <%= f.text_field :age %>

    <%= f.submit %>
<% end %>
```
* check 3000

>>> app/controllers/widgets_controller.rb
drop the following code inside your new action:

`@widget = Widget.new`

* check 3000

>>> app/models
create a file named widget.rb

drop in the following code:
```Ruby
  class Widget < ActiveRecord::Base

  end
```
* check 3000 ~> click on 'create widget' button

>>> app/controllers/widgets_controller.rb
drop in the following code:

```Ruby
  def create
  end
```
* check 3000

>>> app/controllers/widgets_controller.rb
drop the following code inside your create action:

`redirect_to root_path`
* create a widget
* check 3000

>>> /controllers/widgets_controller.rb
drop the following code inside your create action:

```Ruby
  @widget = Widget.new(widget_params)
  @widget.save
```

at the bottom of the controller we will define `widget_params`
in the `private` section.

```Ruby
  private

  def widget_params
    params.require(:widget).ermit(:name, :destroy, :age)
  end
```
* create a widget
* check 3000 ~> it's saved but just not showing.

> views/widgets/index.html.erb
The following code will create a table to list all of your widgets:

```Html
  <% @widgets.each do |widget| %>
    <table>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Age</th>
      </tr>
      <tr>
        <td><%= widget.name %></td>
        <td><%= widget.description %></td>
        <td><%= widget.age %></td>
        <td><%= link_to 'Edit', '#' %></td>
        <td><%= link_to 'Show', '#' %></td>
        <td><%= link_to 'Delete', '#' %></td>
      </tr>
    </table>
  <% end %>
```
* check 3000 ~> Theres a place for it to show, but no instantiation

>>> /controllers/widgets_controller.rb
drop the following code inside your new action:

`@widgets = Widget.all`

* check 3000 ~> Widgets appear!
