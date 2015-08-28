defmodule InvestmentTime.Mailer do
  use Mailgun.Client, domain: Application.get_env(:mailer, :mailgun_domain),
                         key: Application.get_env(:mailer, :mailgun_key)

  alias InvestmentTime.Repo
  alias InvestmentTime.User

  def ask_everyone do
    Repo.all(User)
    |> Enum.each &send_check_email/1
  end

  def send_check_email(user) do
    send_email to: user.email,
             from: "postmaster@tech256.com",
          subject: "Did you even invest?",
             html: Phoenix.View.render_to_string(InvestmentTime.EmailView, "check.html", user: user)
  end
end
