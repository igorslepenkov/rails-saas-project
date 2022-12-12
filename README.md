# README

<div id="top"></div>
<br />
<div align="center">
  <a href="https://github.com/igorslepenkov/rails-alpha-blog">
    <img src="./images.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Rails SaaS Project</h3>

  <p align="center">Educational SaaS Project</p>
</div>

### About Project

This is my third small Ruby project, that I have created during my RoR internship at IThechArt company.
This app represents 'software as a service' pattern and the main idea is to handle Organization-Workers-Projects relations for each separate organization.

It includes 5 models with simple associations, integration of external Stripe API to handle payments, artifacts uploader with CarrierWave and ImageMagick, Devise authentication for Organization and User + Devise-Invitable for creating invitations for Users(workers of Organization)

As the main feature of this project I used "acts as tenant" gem to emulate multitenancy (each Organization has its own account and subdomain, data from one tenant can't be used in another tenant).

Also I have used GoogleCloud integration to store artifact's images for projects.

Font made with HTML-ERB and Bootstrap 5

### Built With

- [Ruby on Rails](https://rubyonrails.org/)
- [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
- [Stripe](https://stripe.com/)
- [CarrierWave gem](https://github.com/carrierwaveuploader/carrierwave)
- [Devise gem](https://github.com/heartcombo/devise)
- [Fog](https://github.com/fog/fog)
