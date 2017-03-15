Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1549711148403070', '1b2ccb5b75937fa4f630e15edb38eac5'
  provider :twitter, 'tS4liDJJt77ZfC2QliDkeyWSO', 'Xm4YOhHHssvlwCJ1eVtbsiuCoN3yPuuCb62iA1rjwpR7N4r9UZ'
  provider :vkontakte, '5909554', '8KhnAtxiub5wOvdKWhlO'
end