require "refile/mini_magick"
Refile::MiniMagick.prepend Module.new {
  [:fill, :size].each do |action|
    define_method(action) do |img, *args|
      super(img, *args) { |cmd| cmd.auto_orient }
    end
  end
}


# module CarrierWave
#   module MiniMagick
#     def fix_exif_rotation
#       manipulate! do |img|
#         img.auto_orient
#         img = yield(img) if block_given?
#         img
#       end
#     end
#   end
# end