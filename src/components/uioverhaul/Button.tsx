import React from 'react';
import { Loader2 } from 'lucide-react';

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
    variant?: 'primary' | 'secondary' | 'ghost' | 'accent';
    isLoading?: boolean;
    size?: 'sm' | 'md' | 'lg';
}

const Button: React.FC<ButtonProps> = ({
    children,
    variant = 'primary',
    isLoading = false,
    size = 'md',
    className = '',
    ...props
}) => {
    const baseStyles = "relative inline-flex items-center justify-center font-display font-bold tracking-wide transition-all duration-200 focus:outline-none disabled:opacity-50 disabled:cursor-not-allowed active:scale-95 overflow-hidden";

    const variants = {
        primary: "bg-primary hover:bg-indigo-400 text-white shadow-lg hover:shadow-neon border border-transparent clip-path-slant",
        secondary: "bg-surfaceHighlight hover:bg-gray-700 text-white border border-gray-600 hover:border-gray-500",
        ghost: "bg-transparent hover:bg-white/5 text-gray-300 hover:text-white",
        accent: "bg-accent hover:bg-pink-400 text-white shadow-lg hover:shadow-neon-accent border border-transparent"
    };

    const sizes = {
        sm: "h-8 px-4 text-sm rounded-sm",
        md: "h-12 px-6 text-base rounded-md",
        lg: "h-14 px-8 text-lg rounded-md",
    };

    // Custom clip-path style for a "tactical" corner cut on primary buttons
    const tacticalStyle = variant === 'primary' || variant === 'accent'
        ? { clipPath: 'polygon(10px 0, 100% 0, 100% calc(100% - 10px), calc(100% - 10px) 100%, 0 100%, 0 10px)' }
        : {};

    return (
        <button
            className={`${baseStyles} ${variants[variant]} ${sizes[size]} ${className}`}
            style={tacticalStyle}
            disabled={isLoading || props.disabled}
            {...props}
        >
            {isLoading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
            {children}
        </button>
    );
};

export default Button;
