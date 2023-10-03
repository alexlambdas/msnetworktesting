import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
    
    public getHello() {
        return { status: 'Hello World' }
    }
}
