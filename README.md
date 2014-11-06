#This is how you do basic CRUD:

####Terminal
`rails new widgets --database=postgresql`

`cd widgets`

`bundle`

`rake db:create`

##### Terminal/second tab
This second terminal tab will be dedicated to your rails server that will be  left running most of the time.

`rails s`

####Browser
Go to: localhost3000 and you should see the Rail welcome page.

####Terminal
`rails g migration MyWidgetsAndThings`

`atom .`

####Atom
> db/migrate/395843344737_my_widgets_and_things.rb

create a new database table with the following code:

```Ruby
  create_table :widgets do |t|
    t.string :name
    t.string :description
    t.integer :age
  end
```
* Additional datatypes to choose from: http://stackoverflow.com/questions/17918117/rails-4-datatypes

####Terminal
`rake db:migrate`

####Atom
> config/routes.rb

delete all the commented out text and add the following code:

```Ruby
  resources :widgets

  root 'widgets#index'
```

> app/controllers

create a folder named the same as db and a file in that folder named
widgets_controller.rb and drop in the following code:

```Ruby
class WidgetsController < ApplicationController

  def index
  end

end
```
* check 3000

> app/views

Create a folder named widgets. Then create a file named index.html.erb

Drop in the following code:

```Html
  <h1>Widgets</h1>
  <%= link_to "New Widget", new_widget_path %>
```
* check 3000

> app/controllers/widgets_controller.rb

Drop in the following code:

```Ruby
  def new
  end
```
* check 3000

> app/views

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

> app/controllers/widgets_controller.rb

drop the following code inside your new action:

`@widget = Widget.new`

* check 3000

> app/models
create a file named widget.rb

drop in the following code:

```Ruby
  class Widget < ActiveRecord::Base

  end
```
* check 3000 ~> click on 'create widget' button

> app/controllers/widgets_controller.rb

drop in the following code:

```Ruby
  def create
  end
```
* check 3000

> app/controllers/widgets_controller.rb

drop the following code inside your create action:

`redirect_to root_path`
* create a widget
* check 3000

> /controllers/widgets_controller.rb
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
* check 3000 ~> There's a place for it to show, but no instantiation.

> /controllers/widgets_controller.rb

Drop the following code inside your new action:

`@widgets = Widget.all`

* check 3000 ~> Widgets appear!

> /views/widgets/index.html.erb

Next to the 'Edit' `link_to` is a hashtag in quotes. replace the hashtag
and quotes with the following code:

`edit_widget_path(widget)`
* check 3000 ~> "The action 'edit' could not be found for WidgetsController"

> /controllers/widgets_controller.rb

Under your create action add an edit action the same way you did for index, new, and create.

```Ruby
  def edit
  end
```
* check 3000 ~> 'Missing template widgets/edit'

> /views/widgets

Create a new view called edit.html.erb
Drop in the following code:

```Html
  <h1>Edit Widget</h1>
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
* check 3000 ~> 'First argument in form cannot contain nil or be empty'

> /controllers/widgets_controller.rb

Drop in the following code:

`@widget = Widget.find(params[:id])`

* check 3000 ~> Click 'Update Widget' button.
* 'The action 'update' could not be found for WidgetsController'

> /controllers/widgets_controller.rb

Under your edit action add an update action.

```Ruby
  def update
  end
```
* check 3000 ~> 'Missing template widgets/update'

> /controllers/widgets_controller.rb

Update doesn't get a view. We want to make sure all the right data is updated for
our widget. `if` that happens we will just redirect the user back to the index.
`Else` should that not happen we will render the edit page again with the following
code:

```Ruby
  @widget = Widget.find(params[:id])
  if @widget.update(widget_params)
    redirect_to root_path
  else
    render :edit
  end
```
* check 3000 ~> We should see that the edits we made updated properly.

> /views/widgets/index.html.erb

Next up the show link. Let's fix the fact that it currently doesn't go anywhere
by replacing the `'#'` with the path `widget_path(widget)`

* check 3000 ~> The action 'show' could not be found for WidgetsController

> /controllers/widgets_controller.rb

Under your update action add an show action.

```Ruby
  def show
  end
```
* check 3000 ~> 'Missing template widgets/show'

> /views/widgets

Create a new view called show.html.erb
If you check localhost you will see there is no more error, but the page is blank.
Drop in the following code to show your widget:

```Html
  <h1><%= @widget.name %></h1>
  <%= @widget.description %></br>
  <%= @widget.age %></br>
  <%= link_to 'All Widgets', widgets_path %> |
  <%= link_to 'Edit', edit_widget_path(@widget) %>
```
* check 3000 ~> You will see a 'NoMethodError': 'undefined method `name' for nil:NilClass'
This is because we have not set our widgets instance variable in the show action yet.

> /controllers/widgets_controller.rb

Add `@widget = Widget.find(params[:id])` Inside your show action.

* check 3000 ~> You should see your widget's name in bold and its description and age.
* Click the 'All Widgets' link to get back to the index page.

> /views/widgets/index.html.erb

Let's replace the `'#'` for the final, 'Delete', link with the following
`project_path(project)` path. We'll also add in a comma and additional functionality
that the destroy action requires in the form of: `, method: :delete`

The full line should now look something like this:
`<td><%= link_to 'Delete', widget_path(widget), method: :delete %></td>`

* check 3000 ~> Click on your 'Delete' link and you should get a familiar 'Unknown action' fail screen.

> /controllers/widgets_controller.rb

To remedy that we will add a destroy action.

```Ruby
 def destroy
 end
```
* check 3000 ~> Now the expected 'Template is missing' fail screen.

> /controllers/widgets_controller.rb

Just like our create and update actions, the destroy action will not require a
view. Instead we will verify the widget, destroy the widget, and
then redirect the user to the index page within the action with the following code:

```Ruby
  @widget = Widget.find(params[:id])
  @widget.destroy
  redirect_to widgets_path
```
* check 3000 ~> Click the 'Delete' link and it should disapear.

Congratulations! You are the proud new owner of a very ugly and useless web app.
Feel free to mess around with the code, break it, add some bootstrap, add another
round of crud, whatever.











...
