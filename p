#include <iostream>

using namespace std;

struct Info
{
    int accountNumber;
    double balance;
    double intrestRate;

    Info(int accountNumber, double balance, double intrestRate)
    {
        this->accountNumber = accountNumber;
        this->balance = 0;
        this->intrestRate = 0;
    }
};

class BankAccount {
private:
    int accountNumber;
    double balance;
    double interestRate;

public:
    void deposit();
    void withdraw();
    void getBalance();
    void getInterestRate();
    void setInterestRate();
    void getAccountNumber();


    BankAccount(int accountNumber, double balance, double interestRate) {
        this->accountNumber = accountNumber;
        this->balance = 0;
        this->interestRate = 0;
    }
    friend bool transfer(BankAccount& from, BankAccount& to, double amount);
};

void BankAccount::deposit() {
    cout << "Введите номер счета: ";
    cin >> this->accountNumber;
    cout << "Внесите деньги: ";
    cin >> this->balance;
    cout << "Счет успешно открыт!" << endl << endl;
}

void BankAccount::withdraw() {
    long long int a;

    do {
        cout << "Cколько нужно снять со счета?";
        cin >> a;
        if (a > this->balance) cout << "Недостаточно средств" << endl;
    } while (a > this->balance);
    this->balance -= a;
    cout << "Деньги успешно сняты" << endl;
}

void BankAccount::getInterestRate() {
    double mounthlyInterestrate = 1.0 / 12;
    cout << "На данный момент ваша процентная ставка 0. Введите по какой ставке хотите пополнить счет" << endl;
    cin >> this->interestRate;
    double interestEarneed = this->balance * this->interestRate * mounthlyInterestrate;
    cout << "Теперь вы будете получать в год: " << interestEarneed << endl;
}

void BankAccount::setInterestRate() {
    double a = 1.0 / 12;
    int b = 5;
    this->interestRate = this->balance * b * a;
    cout << "Ваша процентная ставка обновлена до 5 и теперь вы будете получать: " << this->interestRate;
}

void BankAccount::getBalance() {
    cout << endl << "Текущее состояние счета: " << endl;
    cout << "Номер счета" << this->accountNumber << endl;
    cout << "Количество средств на счете: " << this->balance << endl;
}

void BankAccount::getAccountNumber() {
    cout << "Номер вашей банковской карточки: " << this->accountNumber << endl;
}

bool transfer(BankAccount& from, BankAccount& to, double amount) {
    if (amount <= from.balance) {
        from.balance -= amount;
        to.balance += amount;
        std::cout << "Перевод " << amount << " со счета " << from.accountNumber << " на счет " << to.accountNumber << " успешно" << std::endl;
        return true;
    }
    else {
        std::cerr << "Ошибка " << std::endl;
        return false;
    }
}

int main() {
    setlocale(LC_ALL, "");

    BankAccount account1(1, 0, 0);
    BankAccount account2(2, 0, 0);

    account1.deposit();

    account1.withdraw();

    account1.getBalance();

    account1.getInterestRate();

    account1.setInterestRate();

    account1.getAccountNumber();

    return 0;
}
