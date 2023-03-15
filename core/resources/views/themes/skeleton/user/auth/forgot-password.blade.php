@extends('themes.skeleton.layout.guest')

@section('content')



<div  >
    <div  >
        <div  >
            <div  >
                <img src="{{ asset('public/assets/imgs/' . json_decode(websiteInfo('meta'))->logo) }}" alt="Logo"  >
            </div>
            <h3  >
                Reset Password
            </h3>


            {{-- Form begins --}}
            <form action="{{ route('forgot-password-validate') }}" method="POST"  >
                @csrf
                <div  >
                    <div  >
                        <span  >
                            mail
                        </span>
                        <input type="email" name="email" placeholder="Email"   value="{{ old('email') }}">
                        <span>@error('email') {{ $message }} @enderror </span>
                    </div>
                </div>

                

                @if (websiteInfo('google_captcha') == 'enabled')
                <div  >
                    <div  >
                        {!! htmlFormSnippet() !!}
                        <span>@error('g-recaptcha-response') {{ $message }} @enderror </span>
                    </div>
                </div>
                @endif

                

                <div  >
                    <div  >
                        <span  >
                            login
                        </span>
                        <input type="submit" value="Reset Password"  >
                    </div>
                </div>
            </form>
            {{-- Form end --}}

            {{-- Forgot pass and regiater --}}
            <div  >
                <div>
                    <a href="{{ route('login') }}"  >Back to Login</a>
                </div>

                <div>
                    <a href=""  >Contact Support</a>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection