# # Here is a subtle constant lookup difference.
# # Foo and Baz are effectively the same, but Baz does not have access to BAR_A or BAR_B
# module A
#   BAR_A = 'Bar A!'
#   module B
#     BAR_B = 'Bar B!'

#     class Foo
#       puts 'A::B::Foo'
#       p BAR_A
#       p BAR_B
#     end
#   end
# end

# # > A::B::Foo
# # > Bar A!
# # > Bar B!

# class A::B::Baz
#   puts 'A::B::Baz'
#   p BAR_A
#   p BAR_B
# end

# # > A::B::Baz
# # > ERROR uninitialized constant A::B::Baz::BAR_A
# # > Did you mean?  A::B::BAR_B
# # >                A::BAR_A

# module A
#   module B
#     class AccaDacca
#       puts 'AccaDacca'
#       p BAR_A
#       p BAR_B
#     end
#   end
# end

# # > AccaDacca
# # > Bar A!
# # > Bar B!

# KManager.action :playground do
#   action do
#   end
# end
