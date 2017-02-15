#
# Example 30-14
# Using the menu by name package.
#

Menu_Setup .menubar
Menu Sampler
Menu_Command Sampler Hello! {puts "Hello, World!"}
Menu_Check Sampler Boolean foo {puts "foo = $foo"}
Menu_Separator Sampler
Menu_Cascade Sampler Fruit
Menu_Radio Fruit apple fruit
Menu_Radio Fruit orange fruit
Menu_Radio Fruit kiwi fruit


