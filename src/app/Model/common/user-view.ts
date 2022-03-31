

import { AddressView } from 'src/app/Model/common/address-view';

export class UserView {
    id: number;
    firstName: string;
    middleName: string;
    lastname: string;
    email: string;
    cellPhone: string;
    homePhone: string;
    address: AddressView;
}