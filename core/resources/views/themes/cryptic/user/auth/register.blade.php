@extends('themes.cryptic.layout.guest')

@section('content')

<div class=" w-full px-5">
    <div class="flex justify-center w-full items-center py-8">
        <div class="w-full md:w-3/4 lg:w-2/4 cred-hyip-theme1-primary-card">
            <div class="flex justify-start items-center space-x-5 ml-6">
                <a href="/">
                    <img src="{{ asset('public/assets/imgs/' . json_decode(websiteInfo('meta'))->logo) }}" alt="Logo"
                        class="cred-hyip-theme1-card-logo">
                </a>
                <h3 class="text-xl font-bold text-left text-gray-300">
                    {{ ct('Register') }}
                </h3>
            </div>


            {{-- Form begins --}}
            <form action="{{ route('register-validate') }}" method="POST" class="px-4 mt-6 space-y-6">
                @csrf
                <div class="grid grid-cols-2 gap-2">
                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            person
                        </span>
                        <input type="text" 
                            name="first_name" 
                            value="{{ old('first_name') }}"
                            placeholder="{{ ct('First Name') }}" 
                            class="cred-hyip-theme1-text-input" 
                        >
                        <span>@error('first_name') {{ $message }} @enderror</span>
                    </div>

                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            person
                        </span>
                        <input type="text" 
                            name="last_name" 
                            placeholder="{{ ct('Last Name') }}" 
                            value="{{ old('last_name') }}"
                            class="cred-hyip-theme1-text-input"
                        >
                        <span>@error('last_name') {{ $message }} @enderror</span>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 lg:gap-2">
                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            alternate_email
                        </span>
                        <input type="email" 
                            name="email" 
                            value="{{ old('email') }}"
                            placeholder="{{ ct('Email Address') }}" 
                            class="cred-hyip-theme1-text-input"
                        >
                        <span>@error('email') {{ $message }} @enderror</span>
                    </div>

                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            call
                        </span>
                        <input type="tel" 
                            name="phone_no"
                            value="{{ old('phone_no') }}" 
                            placeholder="{{ ct('Phone No') }}" 
                            class="cred-hyip-theme1-text-input"
                        >
                        <span>@error('phone_no') {{ $message }} @enderror</span>
                    </div>
                </div>

                <div class="grid grid-cols-1">
                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            home
                        </span>
                        <textarea name="street_address" rows="3" placeholder="{{ ct('Current Address') }}" class="cred-hyip-theme1-textarea">{{ old('street_address') }}</textarea>
                        <span>@error('street_address') {{ $message }} @enderror</span>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 lg:gap-2">
                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            map
                        </span>
                        <input type="text" 
                            name="state" 
                            value="{{ old('state') }}"
                            placeholder="{{ ct('State') }}" 
                            class="cred-hyip-theme1-text-input"
                        >
                        <span>@error('state') {{ $message }} @enderror</span>
                    </div>

                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            flag
                        </span>
                        <select name="country" class="cred-hyip-theme1-text-input">                            
                            <option value="" @if(!old('country')) selected @endif disabled>Select Country</option>
                            @if (isset($countries))
                                @foreach ($countries as $country)
                                    <option value="{{ $country['name'] }}" @if(old('country') == $country['name']) selected @endif>{{ $country['name'] }}</option>                
                                @endforeach                
                            @endif 
                            
                        </select>
                        <span>@error('country') {{ $message }} @enderror</span>
                        
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 lg:gap-2">
                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            account_circle
                        </span>
                        <select name="gender" class="cred-hyip-theme1-text-input">
                            <option selected disabled>{{ ct('Select gender') }}</option>
                            <option value="male">{{ ct('Male') }}</option>
                            <option value="female">{{ ct('Female') }}</option>
                            <option value="neutral">{{ ct('Neutral') }}</option>
                        </select>
                        <span>@error('gender') {{ $message }} @enderror</span>
                    </div>

                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 flex items-center pl-2 py-1 text-xs font-bold text-slate-400">
                            {{ ct('D.O.B') }}
                        </span>
                        <input type="date" 
                            name="dob" 
                            value="{{ old('dob') }}"
                            placeholder="Date Of Birth" 
                            class="cred-hyip-theme1-text-input"
                        >
                        <span>@error('dob') {{ $message }} @enderror</span>
                    </div>
                </div>

                <div class="grid grid-cols-1">
                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            emoji_people
                        </span>
                        @if (session()->has('ref_code'))
                            <input type="text" name="referred_by" value="{{ session()->get('ref_code') }}" readonly class="cred-hyip-theme1-text-input">
                        @else
                            <input type="text" name="referred_by" placeholder="{{ ct('Referred By') }}:" value="{{ old('ref_code') }}"  class="cred-hyip-theme1-text-input">
                        @endif
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-2">
                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            password
                        </span>
                        <input type="password" 
                            name="password" 
                            placeholder="{{ ct('Password') }}" 
                            class="cred-hyip-theme1-text-input"
                        >
                        <span>@error('password'){{ $message }} @enderror</span>
                    </div>

                    <div class="relative">
                        <span class="cred-hyip-theme1-input-icon material-icons">
                            password
                        </span>
                        <input type="password" 
                            name="password_confirmation" 
                            placeholder="{{ ct('Confirm Password') }}" 
                            class="cred-hyip-theme1-text-input"
                        >
                    </div>
                </div>

                @if (websiteInfo('google_captcha') == 'enabled')
                <div class="grid grid-cols-1">
                    <div class="relative">
                        {!! htmlFormSnippet() !!}
                        <span>@error('g-recaptcha-response') {{ $message }} @enderror </span>
                    </div>
                </div>                
                @endif

                

                <div class="flex justify-between text-gray-300 text-xs font-semibold mt-4 px-5 lg:px-10">
                    <div class="relative">
                        <span class="cred-hyip-theme1-btn-icon material-icons">
                            app_registration
                        </span>
                        <input type="submit" value="{{ ct('Sign up') }}" class="cred-hyip-theme1-primary-btn">
                    </div>
    
                    <div>
                        <a href="{{ route('login') }}" class="hover:text-purple-700">{{ ct('Already Have Account? Login') }}</a>
                    </div>
                </div>
            </form>
            {{-- Form end --}}
        </div>
    </div>
</div>

@endsection